part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  error,
  login,
  signup,
}

class AuthState extends Equatable {
  const AuthState({
    required this.status,
    this.errorMessage = '',
    this.digest = '',
  });
  final AuthStatus status;
  final String errorMessage;
  final String digest;

  static AuthState initial() => const AuthState(status: AuthStatus.initial);

  AuthState copyWith({
    AuthStatus? status,
    String? errorMessage,
    String? digest,
  }) =>
      AuthState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        digest: digest ?? this.digest,
      );

  @override
  List<Object> get props => [status.name, errorMessage, digest];
}
