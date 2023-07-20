part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetInitialUserEvent extends AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final String email;
  final String password;

  const RegisterUserEvent({
    required this.email,
    required this.password,
  });
}

class SignInUserEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInUserEvent({
    required this.email,
    required this.password,
  });
}
