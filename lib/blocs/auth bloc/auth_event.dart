part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {

  const SignUpEvent({
    required this.email,
    required this.password,
    required this.userName,
  });
  final String email, password, userName;

  @override
  List<Object> get props => [email, password, userName];
}

class LogInEvent extends AuthEvent {

  const LogInEvent({
    required this.email,
    required this.password,
  });
  final String email, password;

  @override
  List<Object> get props => [email, password];
}

class LogOutEvent extends AuthEvent {}
