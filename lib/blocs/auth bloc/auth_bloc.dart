import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_go/models/export_models.dart';
import 'package:quiz_go/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _service;

  AuthBloc({required AuthService service})
      : _service = service,
        super(AuthState.initial()) {
    on<SignUpEvent>(_onSignUpEvent);
    on<LogInEvent>(_onLogInEvent);
    on<LogOutEvent>(_onLogOutEvent);
  }

  Future<void> _onSignUpEvent(SignUpEvent event, Emitter emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final signUpResponse =
          await _service.signUp(event.email, event.password, event.userName);

      late UserModel userModel;
      signUpResponse.fold(
        (error) => throw error.message,
        (user) => userModel = user,
      );

      final res = await _service.saveToFirestore(userModel.toMap());
      res.fold(
        (error) => throw error.message,
        (success) => emit(state.copyWith(status: AuthStatus.signup)),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onLogInEvent(LogInEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final signUpResponse = await _service.login(event.email, event.password);
      signUpResponse.fold(
        (error) => throw error.message,
        (userId) => emit(state.copyWith(status: AuthStatus.login)),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onLogOutEvent(LogOutEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final response = await _service.signOut();
      response.fold(
        (error) => throw error.message,
        (r) => emit(state.copyWith(status: AuthStatus.initial)),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
