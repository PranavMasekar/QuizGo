part of 'question_bloc.dart';

sealed class QuestionEvent extends Equatable {
  const QuestionEvent();
}

class SelectedOptionEvent extends QuestionEvent {
  final String optionId;
  const SelectedOptionEvent({required this.optionId});

  @override
  List<Object?> get props => [optionId];
}
