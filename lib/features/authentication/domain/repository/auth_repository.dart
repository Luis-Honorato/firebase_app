import 'package:dartz/dartz.dart';
import 'package:firebase_app/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<Either<Failure, User>> getInitialUser();
}
