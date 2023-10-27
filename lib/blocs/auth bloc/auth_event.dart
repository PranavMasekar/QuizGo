part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  const SignUpEvent({
    required this.password,
    required this.userName,
  });
  final String password, userName;

  @override
  List<Object> get props => [password, userName];
}

class LogInEvent extends AuthEvent {
  const LogInEvent({
    required this.username,
    required this.password,
  });
  final String username, password;

  @override
  List<Object> get props => [username, password];
}

class ResetPasswordEvent extends AuthEvent {
  const ResetPasswordEvent({
    required this.username,
    required this.password,
  });
  final String username, password;

  @override
  List<Object> get props => [username, password];
}

class LogOutEvent extends AuthEvent {}
