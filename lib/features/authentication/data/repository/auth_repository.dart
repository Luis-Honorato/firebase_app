import 'package:dartz/dartz.dart';
import 'package:firebase_app/features/authentication/data/datsource/firebase_datasource.dart';
import 'package:firebase_app/features/authentication/data/failures/failures.dart';
import 'package:firebase_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:firebase_app/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseDataSource firebaseDataSource;

  AuthRepository(this.firebaseDataSource);

  @override
  Future<Either<Failure, User>> getInitialUser() async {
    try {
      final user = firebaseDataSource.getCurrentUser();

      return Right(user!);
    } catch (e) {
      return const Left(GetCurrentUserFalure(''));
    }
  }
}
