import 'package:firebase_app/utils/failure.dart';

class GetCurrentUserFalure extends Failure {
  const GetCurrentUserFalure(super.message);
}

class RegisterUserFailure extends Failure {
  const RegisterUserFailure(super.message);
}

class SignInUserFailure extends Failure {
  const SignInUserFailure(super.message);
}
