import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(ScoreState.initial());

  void setQuiz(int totalQuestions) {
    emit(state.copyWith(totalQuestions: totalQuestions, correctQuestion: 0));
    log('Current Quiz : ${state.correctQuestion} / ${state.totalQuestions}');
  }

  void addCorrectAnswer() {
    final correctQuestions = state.correctQuestion;
    emit(state.copyWith(correctQuestion: correctQuestions + 1));
    log('New Score : ${state.correctQuestion} / ${state.totalQuestions}');
  }

  void resetQuiz() {
    emit(const ScoreState());
  }
}
