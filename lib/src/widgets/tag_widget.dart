import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String title;
  const TagWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5BE51)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
