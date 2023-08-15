part of 'quiz_bloc.dart';

enum QuizStatus { initial, loading, loaded, error }

class QuizState extends Equatable {
  final List<QuestionModel> quiz;
  final String errorMessage;
  final QuizStatus status;

  const QuizState({
    required this.status,
    this.quiz = const [],
    this.errorMessage = "",
  });

  static QuizState initial() => const QuizState(status: QuizStatus.initial);

  QuizState copyWith({
    List<QuestionModel>? quiz,
    QuizStatus? status,
    String? errorMessage,
  }) {
    return QuizState(
      status: status ?? this.status,
      quiz: quiz ?? this.quiz,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [quiz, status.name, errorMessage];
}
