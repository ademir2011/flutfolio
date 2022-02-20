import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({
    Key? key,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 10),
        const Divider(indent: 0, endIndent: 0, height: 0.5),
        const SizedBox(height: 20),
      ],
    );
  }
}
