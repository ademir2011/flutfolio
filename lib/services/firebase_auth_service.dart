import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutfolio/services/firebase_auth_interface.dart';

class FirebaseAuthService implements FirebaseAuthInterface {
  final firebaseAuthInstance = FirebaseAuth.instance;

  @override
  void firebaseSignOut() async {
    await firebaseAuthInstance.signOut();
  }

  @override
  Future<UserCredential> firebaseSignIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuthInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> firebaseSignUp({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    return await firebaseAuthInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
