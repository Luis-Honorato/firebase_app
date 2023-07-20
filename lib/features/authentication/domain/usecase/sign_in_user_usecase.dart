import 'package:dartz/dartz.dart';
import 'package:firebase_app/features/authentication/data/failures/auth_success.dart';
import 'package:firebase_app/features/authentication/data/repository/auth_repository.dart';
import 'package:firebase_app/utils/failure.dart';

class SinginUserUsecase {
  final AuthRepository authRepository;

  SinginUserUsecase(this.authRepository);

  Future<Either<Failure, SignInUserSuccess>> call({
    required String email,
    required String password,
  }) async {
    return await authRepository.signInUser(
      email: email,
      password: password,
    );
  }
}
