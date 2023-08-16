part of 'score_cubit.dart';

class ScoreState extends Equatable {
  final int correctQuestion;
  final int totalQuestions;

  const ScoreState({this.correctQuestion = 0, this.totalQuestions = 0});

  static ScoreState initial() => const ScoreState();

  ScoreState copyWith({int? correctQuestion, int? totalQuestions}) {
    return ScoreState(
      correctQuestion: correctQuestion ?? this.correctQuestion,
      totalQuestions: totalQuestions ?? this.totalQuestions,
    );
  }

  @override
  List<Object?> get props => [correctQuestion, totalQuestions];
}
