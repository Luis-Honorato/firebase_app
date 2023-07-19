import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  User? getCurrentUser() {
    late final User? userEntity;
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) userEntity = user;
    });

    return userEntity;
  }
}
