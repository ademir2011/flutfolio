import 'package:flutter/material.dart';

class TrajetoryPage extends StatelessWidget {
  const TrajetoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'TRAJETÓRIA',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
