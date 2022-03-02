import 'package:flutfolio/src/widgets/card_generic_widget.dart';
import 'package:flutter/material.dart';

class GenericActionIconWidget extends StatelessWidget {
  const GenericActionIconWidget({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  final IconData iconData;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CardGenericWidget(
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
        ),
      ),
    );
  }
}
