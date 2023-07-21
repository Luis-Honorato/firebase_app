part of 'auth_bloc.dart';

enum UserStatus {
  unauthenticated,
  authenticated,
}

class AuthState extends Equatable {
  final UserStatus userStatus;
  final User? user;
  final RequestStatus registerUserStatus;
  final RequestStatus signInUserStatus;
  final RequestStatus signOutUserStatus;
  const AuthState({
    this.userStatus = UserStatus.unauthenticated,
    this.registerUserStatus = RequestStatus.initial,
    this.signInUserStatus = RequestStatus.initial,
    this.signOutUserStatus = RequestStatus.initial,
    this.user,
  });

  AuthState copyWith({
    UserStatus? userStatus,
    User? user,
    RequestStatus? registerUserStatus,
    RequestStatus? signInUserStatus,
    RequestStatus? signOutUserStatus,
  }) {
    return AuthState(
      userStatus: userStatus ?? this.userStatus,
      user: user ?? this.user,
      registerUserStatus: registerUserStatus ?? this.registerUserStatus,
      signInUserStatus: signInUserStatus ?? this.signInUserStatus,
      signOutUserStatus: signOutUserStatus ?? this.signOutUserStatus,
    );
  }

  @override
  List<Object?> get props => [
        userStatus,
        user,
        registerUserStatus,
        signInUserStatus,
        signOutUserStatus,
      ];
}
