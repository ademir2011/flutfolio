import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthInterface {
  Future<UserCredential> firebaseSignIn({required String email, required String password});
  Future<UserCredential> firebaseSignUp(
      {required String email, required String password, required String confirmPassword});
  void firebaseSignOut();
}
