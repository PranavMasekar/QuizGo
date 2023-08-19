part of 'password_cubit.dart';

class PasswordState extends Equatable {

  const PasswordState({this.showPassword = false});
  final bool showPassword;

  static PasswordState initial() => const PasswordState();

  PasswordState copyWith({bool? showPassword}) =>
      PasswordState(showPassword: showPassword ?? this.showPassword);

  @override
  List<Object?> get props => [showPassword];
}
