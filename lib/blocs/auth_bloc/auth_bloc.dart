import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final signUpResponse =
          await _service.signUp(event.email, event.password, event.userName);
      signUpResponse.fold(
        (error) => throw error.message,
        (user) async {
          final res = await _service.saveToFirestore(user.toMap());
          res.fold(
            (error) => throw error.message,
            (success) => emit(state.copyWith(status: AuthStatus.authenticated)),
          );
        },
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
        (user) => emit(state.copyWith(status: AuthStatus.authenticated)),
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
        (r) => emit(state.copyWith(status: AuthStatus.unAuthenticated)),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
