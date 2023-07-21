import 'package:dartz/dartz.dart';
import 'package:firebase_app/features/authentication/data/failures/auth_success.dart';
import 'package:firebase_app/features/authentication/data/repository/auth_repository.dart';
import 'package:firebase_app/utils/failure.dart';

class SignOutUserUsecase {
  final AuthRepository authRepository;

  SignOutUserUsecase(this.authRepository);

  Future<Either<Failure, SignOutUserSuccess>> call() async {
    return await authRepository.signOutUser();
  }
}
