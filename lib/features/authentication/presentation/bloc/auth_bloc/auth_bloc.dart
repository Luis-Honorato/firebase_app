import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_app/features/authentication/domain/usecase/get_initial_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

final _authLog = Logger(
    printer: PrettyPrinter(
  colors: true,
  errorMethodCount: 0,
  noBoxingByDefault: true,
  stackTraceBeginIndex: 2,
));

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetInitialUserUsecase getInitialUserUsecase;
  AuthBloc(
    this.getInitialUserUsecase,
  ) : super(const AuthState()) {
    on<GetInitialUserEvent>((event, emit) async {
      final result = await getInitialUserUsecase();

      result.fold(
        (failure) => _authLog.i('Usuário não autenticado'),
        (user) {
          emit(state.copyWith(user: user));
          _authLog.i('Usuário Autenticado');
        },
      );
    });
  }
}
