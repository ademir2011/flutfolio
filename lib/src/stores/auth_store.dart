import 'package:flutfolio/src/services/firebase_auth_service.dart';
import 'package:flutter/cupertino.dart';

class AuthStore extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firebaseService = FirebaseAuthService();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  var errorMesssage = '';

  bool get isAuthenticate => firebaseService.authInstance.currentUser != null;

  void authSubmit(BuildContext context) async {
    toogleLoading();
    if (formKey.currentState!.validate()) {
      await firebaseService.signIn(email: emailController.text, password: passwordController.text).then((value) {
        print(value.user?.uid ?? 'null');
        Navigator.of(context).pushReplacementNamed('/');
      }).catchError((error) {
        errorMesssage = error.toString();
      });
    }
    toogleLoading();
  }

  void logout() {
    firebaseService.signOut();
  }

  void toogleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
