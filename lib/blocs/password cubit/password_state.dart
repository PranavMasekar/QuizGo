part of 'password_cubit.dart';

class PasswordState extends Equatable {
  final bool showPassword;

  const PasswordState({this.showPassword = false});

  static PasswordState initial() => const PasswordState();

  PasswordState copyWith({bool? showPassword}) =>
      PasswordState(showPassword: showPassword ?? this.showPassword);

  @override
  List<Object?> get props => [showPassword];
}
