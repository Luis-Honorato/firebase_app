import 'package:firebase_app/features/authentication/data/datsource/firebase_datasource.dart';
import 'package:firebase_app/features/authentication/data/repository/auth_repository.dart';
import 'package:firebase_app/features/authentication/domain/usecase/get_initial_user.dart';
import 'package:firebase_app/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';

final AuthBloc authBloc = AuthBloc(
  GetInitialUserUsecase(
    AuthRepository(FirebaseDataSource()),
  ),
);
