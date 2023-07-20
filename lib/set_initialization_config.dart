import 'package:firebase_core/firebase_core.dart';
import 'features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'firebase_options.dart';
import 'initial_instances.dart';

class InitializeConfigs {
  static Future<void> startApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    authBloc.add(GetInitialUserEvent());
  }
}
