import 'package:dartz/dartz.dart';
import 'package:firebase_app/features/authentication/data/datsource/firebase_datasource.dart';
import 'package:firebase_app/features/authentication/data/failures/auth_failures.dart';
import 'package:firebase_app/features/authentication/data/failures/auth_success.dart';
import 'package:firebase_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:firebase_app/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseDataSource firebaseDataSource;

  AuthRepository(this.firebaseDataSource);

  @override
  Future<Either<Failure, User>> getInitialUser() async {
    try {
      final user = await firebaseDataSource.getCurrentUser();

      return Right(user!);
    } catch (e) {
      return const Left(GetCurrentUserFalure(''));
    }
  }

  @override
  Future<Either<Failure, RegisterUserSuccess>> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseDataSource.registerUser(
        email: email,
        password: password,
      );
      return Right(RegisterUserSuccess());
    } catch (e) {
      // TODO: tratar erros
      return const Left(RegisterUserFailure(''));
    }
  }

  @override
  Future<Either<Failure, SignInUserSuccess>> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseDataSource.signInUser(
        email: email,
        password: password,
      );

      return Right(SignInUserSuccess());
    } catch (e) {
      return const Left(SignInUserFailure(''));
    }
  }

  @override
  Future<Either<Failure, SignOutUserSuccess>> signOutUser() async {
    try {
      await firebaseDataSource.signOutUser();

      return Right(SignOutUserSuccess());
    } catch (e) {
      return const Left(SignOutUserFailure(''));
    }
  }
}
