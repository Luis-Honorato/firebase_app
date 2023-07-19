import 'package:dartz/dartz.dart';
import 'package:firebase_app/features/authentication/data/repository/auth_repository.dart';
import 'package:firebase_app/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetInitialUserUsecase {
  final AuthRepository authRepository;

  GetInitialUserUsecase(this.authRepository);

  Future<Either<Failure, User>> call() async {
    return await authRepository.getInitialUser();
  }
}
