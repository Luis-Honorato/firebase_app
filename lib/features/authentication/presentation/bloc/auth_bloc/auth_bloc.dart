import 'package:bloc/bloc.dart';
import 'package:firebase_app/features/authentication/domain/usecase/register_user_usecase.dart';
import 'package:firebase_app/features/authentication/domain/usecase/sign_in_user_usecase.dart';
import 'package:firebase_app/features/authentication/domain/usecase/sign_out_user_usecase.dart';
import 'package:firebase_app/utils/request_status.dart';
import 'package:logger/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_app/features/authentication/domain/usecase/get_initial_user_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

final _authLog = Logger(
  printer: PrettyPrinter(
    colors: true,
    errorMethodCount: 0,
    noBoxingByDefault: true,
    stackTraceBeginIndex: 2,
  ),
);

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetInitialUserUsecase getInitialUserUsecase;
  final RegisterUserUsecase registerUserUsecase;
  final SignInUserUsecase signInUserUsecase;
  final SignOutUserUsecase signOutUserUsecase;
  AuthBloc(
    this.getInitialUserUsecase,
    this.registerUserUsecase,
    this.signInUserUsecase,
    this.signOutUserUsecase,
  ) : super(const AuthState()) {
    on<GetInitialUserEvent>((event, emit) async {
      final result = await getInitialUserUsecase();

      result.fold(
        (failure) => _authLog.i('Usuário não autenticado'),
        (user) {
          emit(state.copyWith(
            user: user,
            userStatus: UserStatus.authenticated,
          ));
          _authLog.i('Usuário Autenticado');
        },
      );
    });

    on<RegisterUserEvent>((event, emit) async {
      emit(state.copyWith(
        registerUserStatus: RequestStatus.loading,
      ));

      final result = await registerUserUsecase(
        email: event.email,
        password: event.password,
      );

      result.fold((failure) {
        emit(state.copyWith(
          registerUserStatus: RequestStatus.failure,
        ));
        _authLog.e('Não foi possível logar o usuário');
      }, (success) {
        emit(state.copyWith(
          registerUserStatus: RequestStatus.success,
        ));
        _authLog.d('Usuário Registrado com sucesso');
      });
    });

    on<SignInUserEvent>((event, emit) async {
      emit(state.copyWith(
        signInUserStatus: RequestStatus.loading,
      ));

      final result = await signInUserUsecase(
        email: event.email,
        password: event.password,
      );

      result.fold((failure) {
        emit(state.copyWith(
          signInUserStatus: RequestStatus.failure,
        ));
        _authLog.e('Não foi possível logar o usuároi');
      }, (success) {
        emit(state.copyWith(
          signInUserStatus: RequestStatus.success,
          userStatus: UserStatus.authenticated,
        ));
        _authLog.d('Usuário logado com sucesso');
      });
    });

    on<SignOutUserEvent>((event, emit) async {
      emit(state.copyWith(
        signOutUserStatus: RequestStatus.loading,
      ));

      final result = await signOutUserUsecase();

      result.fold((failue) {
        emit(state.copyWith(signOutUserStatus: RequestStatus.failure));
        _authLog.e('Não foi possível deslogar o usuário');
      }, (success) {
        emit(state.copyWith(
          signOutUserStatus: RequestStatus.success,
          userStatus: UserStatus.unauthenticated,
        ));
        _authLog.d('Usuário deslogado com sucesso');
      });
    });
  }
}
