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
    on<LoadQuizEvent>(_onLoadQuizEvent);
  }

  final QuizService _quizService;

  Future<void> _onLoadQuizEvent(
    LoadQuizEvent event,
    Emitter<QuizState> emit,
  ) async {
    emit(state.copyWith(status: QuizStatus.loading));
    try {
      final quizResponse = await _quizService.loadQuiz(event.category);

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
}
