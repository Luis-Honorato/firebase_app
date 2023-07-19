part of 'auth_bloc.dart';

enum UserStatus {
  unauthenticated,
  authenticated,
}

class AuthState extends Equatable {
  final UserStatus userStatus;
  final User? user;
  const AuthState({
    this.userStatus = UserStatus.unauthenticated,
    this.user,
  });

  @override
  List<Object> get props => [];

  AuthState copyWith({
    UserStatus? userStatus,
    User? user,
  }) {
    return AuthState(
      userStatus: userStatus ?? this.userStatus,
      user: user ?? this.user,
    );
  }
}
