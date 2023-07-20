import 'package:firebase_app/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:firebase_app/initial_instances.dart';
import 'package:firebase_app/set_initialization_config.dart';
import 'package:firebase_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitializeConfigs.startApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(
          value: authBloc,
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
    );
  }
}
