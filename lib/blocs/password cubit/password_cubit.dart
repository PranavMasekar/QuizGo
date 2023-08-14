import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordState.initial());

  void changeState() {
    emit(PasswordState(showPassword: !state.showPassword));
  }
}
