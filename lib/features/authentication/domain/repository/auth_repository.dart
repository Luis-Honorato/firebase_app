import 'package:dartz/dartz.dart';
import 'package:firebase_app/features/authentication/data/failures/auth_success.dart';
import 'package:firebase_app/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<Either<Failure, User>> getInitialUser();
  Future<Either<Failure, RegisterUserSuccess>> registerUser({
    required String email,
    required String password,
  });
  Future<Either<Failure, SignInUserSuccess>> signInUser({
    required String email,
    required String password,
  });
}
