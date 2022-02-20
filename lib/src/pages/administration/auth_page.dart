import 'package:flutfolio/src/services/firebase_auth_service.dart';
import 'package:flutfolio/src/widgets/card_generic_widget.dart';
import 'package:flutfolio/src/widgets/textinput_widget.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firebaseService = FirebaseAuthService();
  var _isLoading = false;
  var _errorMesssage = '';

  void _submitForm() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await firebaseService
          .firebaseSignIn(email: emailController.text, password: passwordController.text)
          .then((value) {
        print(value.user?.uid ?? 'null');
      }).catchError((error) {
        _errorMesssage = error.toString();
      });
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Form(
            key: formKey,
            child: CardGenericWidget(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    _errorMesssage.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              _errorMesssage,
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                              ),
                            ),
                          )
                        : Container(),
                    TextFormInputWidget(
                      controller: emailController,
                      hintText: 'E-mail',
                      validator: (email) {
                        final _email = email ?? '';
                        if (_email.isEmpty) {
                          return 'E-mail não inserido!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormInputWidget(
                      controller: passwordController,
                      hintText: 'Senha',
                      validator: (password) {
                        final _password = password ?? '';
                        if (_password.isEmpty) {
                          return 'E-mail não inserido!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: !_isLoading
                                ? Text(
                                    'AUTENTICAR',
                                    style: Theme.of(context).textTheme.headline3,
                                  )
                                : CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                    strokeWidth: 2,
                                  ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          onPressed: _submitForm,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
