part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();
}

class LoadProgrammingQuizEvent extends QuizEvent {
  const LoadProgrammingQuizEvent({required this.category});
  final String category;

  @override
  List<Object?> get props => [category];
}

class LoadEntertainmentQuizEvent extends QuizEvent {
  const LoadEntertainmentQuizEvent({required this.category});
  final int category;

  @override
  List<Object?> get props => [category];
}
