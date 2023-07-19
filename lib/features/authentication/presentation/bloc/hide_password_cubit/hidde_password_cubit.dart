import 'package:bloc/bloc.dart';

class HiddePasswordCubit extends Cubit<bool> {
  HiddePasswordCubit() : super(true);

  showPassword() {
    emit(false);
  }

  hiddePassword() {
    emit(true);
  }
}
