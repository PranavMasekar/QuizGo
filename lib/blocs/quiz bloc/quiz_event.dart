part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();
}

class LoadQuizEvent extends QuizEvent {
  final String category;

  const LoadQuizEvent({required this.category});

  @override
  List<Object?> get props => [category];
}
