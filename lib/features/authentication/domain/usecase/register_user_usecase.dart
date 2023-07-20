import 'package:dartz/dartz.dart';
import 'package:firebase_app/features/authentication/data/failures/auth_success.dart';
import 'package:firebase_app/features/authentication/data/repository/auth_repository.dart';
import 'package:firebase_app/utils/failure.dart';

class RegisterUserUsecase {
  final AuthRepository authRepository;

  RegisterUserUsecase(this.authRepository);

  Future<Either<Failure, RegisterUserSuccess>> call({
    required String email,
    required String password,
  }) async {
    return await authRepository.registerUser(
      email: email,
      password: password,
    );
  }
}
