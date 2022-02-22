import 'package:flutfolio/src/services/firebase_auth_service.dart';
import 'package:flutfolio/src/stores/auth_store.dart';
import 'package:flutfolio/src/widgets/card_generic_widget.dart';
import 'package:flutfolio/src/widgets/textinput_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final authStore = GetIt.I<AuthStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authStore.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Form(
            key: authStore.formKey,
            child: CardGenericWidget(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    authStore.errorMesssage.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              authStore.errorMesssage,
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                              ),
                            ),
                          )
                        : Container(),
                    TextFormInputWidget(
                      controller: authStore.emailController,
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
                      controller: authStore.passwordController,
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
                            child: !authStore.isLoading
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
                          onPressed: () => authStore.authSubmit(context),
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
