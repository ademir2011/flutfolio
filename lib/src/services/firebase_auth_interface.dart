import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthInterface {
  Future<UserCredential> signIn({required String email, required String password});
  Future<UserCredential> signUp({required String email, required String password, required String confirmPassword});
  void signOut();
}
