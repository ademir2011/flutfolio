import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'CONTATOS',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
