part of 'question_bloc.dart';

class QuestionState extends Equatable {
  final bool isOptionSelected;
  final String optioniD;

  const QuestionState({this.isOptionSelected = false, this.optioniD = ""});

  static QuestionState initial() => const QuestionState();

  @override
  List<Object?> get props => [isOptionSelected];
}
