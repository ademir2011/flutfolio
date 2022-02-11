import 'package:flutter/material.dart';

class CertificationsPage extends StatelessWidget {
  const CertificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'CERTIFICAÇÕES',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
