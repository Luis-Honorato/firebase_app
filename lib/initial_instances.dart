import 'package:firebase_app/features/authentication/data/datsource/firebase_datasource.dart';
import 'package:firebase_app/features/authentication/data/repository/auth_repository.dart';
import 'package:firebase_app/features/authentication/domain/usecase/get_initial_user_usecase.dart';
import 'package:firebase_app/features/authentication/domain/usecase/register_user_usecase.dart';
import 'package:firebase_app/features/authentication/domain/usecase/sign_in_user_usecase.dart';
import 'package:firebase_app/features/authentication/domain/usecase/sign_out_user_usecase.dart';
import 'package:firebase_app/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';

final authRepository = AuthRepository(FirebaseDataSource());

final AuthBloc authBloc = AuthBloc(
  GetInitialUserUsecase(authRepository),
  RegisterUserUsecase(authRepository),
  SignInUserUsecase(authRepository),
  SignOutUserUsecase(authRepository),
);
