part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  error,
  login,
  signup,
}

class AuthState extends Equatable {
  const AuthState({required this.status, this.errorMessage = ''});
  final AuthStatus status;
  final String errorMessage;

  static AuthState initial() => const AuthState(status: AuthStatus.initial);

  AuthState copyWith({AuthStatus? status, String? errorMessage}) => AuthState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object> get props => [status.name, errorMessage];
}
