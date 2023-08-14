part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  final String email, password, userName;

  const SignUpEvent({
    required this.email,
    required this.password,
    required this.userName,
  });

  @override
  List<Object> get props => [email, password, userName];
}

class LogInEvent extends AuthEvent {
  final String email, password;

  const LogInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class LogOutEvent extends AuthEvent {}
