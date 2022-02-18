import 'package:flutter/material.dart';

class CCardGeneric extends StatelessWidget {
  final Widget child;
  const CCardGeneric({
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
        boxShadow: const [
          BoxShadow(
            color: Color(0xCCE5BE51),
            blurRadius: 2.5,
            spreadRadius: 0.5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}
