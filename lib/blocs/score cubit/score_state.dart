part of 'score_cubit.dart';

class ScoreState extends Equatable {

  const ScoreState({this.correctQuestion = 0, this.totalQuestions = 0});
  final int correctQuestion;
  final int totalQuestions;

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
