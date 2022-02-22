import 'package:flutter/material.dart';

class CardGenericWidget extends StatelessWidget {
  final Widget child;
  const CardGenericWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).cardTheme.color,
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: child,
    );
  }
}
