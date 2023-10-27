import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_go/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthService service})
      : _service = service,
        super(AuthState.initial()) {
    on<SignUpEvent>(_onSignUpEvent);
    on<LogInEvent>(_onLogInEvent);
    on<LogOutEvent>(_onLogOutEvent);
    on<ResetPasswordEvent>(_onResetPasswordEvent);
  }
  final AuthService _service;

  Future<void> _onSignUpEvent(SignUpEvent event, Emitter emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final signUpResponse =
          await _service.signUp(event.userName, event.password);

      late String digest;
      signUpResponse.fold(
        (error) => throw error.message,
        (hash) => digest = hash,
      );

      emit(state.copyWith(status: AuthStatus.signup, digest: digest));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onLogInEvent(LogInEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final loginResponse = await _service.login(
        event.username,
        event.password,
      );

      loginResponse.fold(
        (error) => throw error.message,
        (hash) => emit(state.copyWith(status: AuthStatus.login, digest: hash)),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onResetPasswordEvent(
    ResetPasswordEvent event,
    Emitter emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final loginResponse = await _service.resetPassword(
        event.username,
        event.password,
      );

      loginResponse.fold(
        (error) => throw error.message,
        (hash) => emit(state.copyWith(status: AuthStatus.login, digest: hash)),
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
