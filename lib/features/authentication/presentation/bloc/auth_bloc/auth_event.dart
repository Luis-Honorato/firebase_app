part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// Event responsible to get first instance of user and set if user is authenticated
/// or unauthenticated.
class GetInitialUserEvent extends AuthEvent {}

/// Event responsible to register user in firebase Auth, if was succesfully
/// will also signIn the user and save his data in Firebase Firestore.
///
/// Should be redirected to home page.
class RegisterUserEvent extends AuthEvent {
  final String email;
  final String password;

  const RegisterUserEvent({
    required this.email,
    required this.password,
  });
}

/// Event responsible to sign in user and authenticate with Firebase Auth.
///
/// Should be redirected to home page.
class SignInUserEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInUserEvent({
    required this.email,
    required this.password,
  });
}

/// Event responsible to sing out user and unauthenticate with Firebase Auth.
///
/// Should be redirected to login page.
class SignOutUserEvent extends AuthEvent {}
