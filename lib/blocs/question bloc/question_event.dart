part of 'question_bloc.dart';

sealed class QuestionEvent extends Equatable {
  const QuestionEvent();
}

class SelectedOptionEvent extends QuestionEvent {
  const SelectedOptionEvent({required this.optionId});
  final String optionId;

  @override
  List<Object?> get props => [optionId];
}
