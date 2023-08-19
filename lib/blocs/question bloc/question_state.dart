part of 'question_bloc.dart';

class QuestionState extends Equatable {

  const QuestionState({this.isOptionSelected = false, this.optioniD = ''});
  final bool isOptionSelected;
  final String optioniD;

  static QuestionState initial() => const QuestionState();

  @override
  List<Object?> get props => [isOptionSelected];
}
