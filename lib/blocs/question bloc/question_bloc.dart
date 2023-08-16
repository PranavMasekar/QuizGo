import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(QuestionState.initial()) {
    on<SelectedOptionEvent>((event, emit) {
      emit(QuestionState(isOptionSelected: true, optioniD: event.optionId));
    });
  }
}
