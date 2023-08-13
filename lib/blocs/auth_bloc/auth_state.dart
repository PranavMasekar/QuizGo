part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  error,
  authenticated,
  unAuthenticated,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final String errorMessage;
  const AuthState({required this.status, this.errorMessage = ""});

  static AuthState initial() => const AuthState(status: AuthStatus.initial);

  AuthState copyWith({AuthStatus? status, String? errorMessage}) => AuthState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object> get props => [status];
}
