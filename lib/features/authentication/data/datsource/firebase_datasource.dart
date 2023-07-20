import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    late final User? userEntity;
    await _firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) {
        userEntity = user;
      }
    });

    return userEntity;
  }

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
