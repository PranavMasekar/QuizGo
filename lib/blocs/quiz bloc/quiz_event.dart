part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();
}

class LoadQuizEvent extends QuizEvent {

  const LoadQuizEvent({required this.category});
  final String category;

  @override
  List<Object?> get props => [category];
}
