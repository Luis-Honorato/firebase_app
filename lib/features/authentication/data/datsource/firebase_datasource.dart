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
}
