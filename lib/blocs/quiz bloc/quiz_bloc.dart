import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_go/models/export_models.dart';
import 'package:quiz_go/services/export_services.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({required QuizService quizService})
      : _quizService = quizService,
        super(QuizState.initial()) {
    on<LoadProgrammingQuizEvent>(_onLoadQuizEvent);
    on<LoadEntertainmentQuizEvent>(_onLoadEntertainmentQuizEvent);
  }

  final QuizService _quizService;

  Future<void> _onLoadQuizEvent(
    LoadProgrammingQuizEvent event,
    Emitter<QuizState> emit,
  ) async {
    emit(state.copyWith(status: QuizStatus.loading));
    try {
      final quizResponse =
          await _quizService.loadProgrammingQuiz(event.category);

      late List data;
      quizResponse.fold(
        (error) => throw error.message,
        (d) => data = d,
      );

      final quiz = <QuestionModel>[];
      for (final Map<String, dynamic> item in data) {
        quiz.add(QuestionModel.fromMap(item));
      }

      log('Deserialized Data\n');
      log(quiz.length.toString());
      emit(state.copyWith(status: QuizStatus.loaded, quiz: quiz));
    } catch (e) {
      emit(
        state.copyWith(status: QuizStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onLoadEntertainmentQuizEvent(
    LoadEntertainmentQuizEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(status: QuizStatus.loading));
    final quizResponse =
        await _quizService.loadEntertainmentQuizes(event.category);

    late List data;
    quizResponse.fold(
      (error) => throw error.message,
      (d) => data = d,
    );

    final quiz = <QuestionModel>[];
    for (final Map<String, dynamic> item in data) {
      quiz.add(createModel(item));
    }

    log('Deserialized Data\n');
    log(quiz.toString());
    emit(state.copyWith(status: QuizStatus.loaded, quiz: quiz));
  }

  QuestionModel createModel(Map<String, dynamic> data) {
    // Storing correct and incorrect answers
    final correctAnswer = data['correct_answer'];
    List options = data['incorrect_answers'];
    options.add(correctAnswer);

    // Creating option list
    List<Option> allOptions = [];
    int index = 0;
    String correctOption = "";
    for (String option in options) {
      allOptions.add(Option(id: index.toString(), text: option));
      if (option == correctAnswer) {
        correctOption = index.toString();
      }
      index++;
    }

    // Shuffles the options list
    allOptions.shuffle();

    return QuestionModel(
      id: 0,
      question: data['question'],
      options: allOptions,
      correctOption: correctOption,
    );
  }
}
