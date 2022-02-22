import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutfolio/src/services/firebase_auth_interface.dart';

class FirebaseAuthService implements FirebaseAuthInterface {
  final authInstance = FirebaseAuth.instance;

  @override
  void signOut() async {
    await authInstance.signOut();
  }

  @override
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await authInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    return await authInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
