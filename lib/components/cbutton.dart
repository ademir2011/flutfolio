import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onPressed;

  const CButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onHover: (isHover) {},
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).iconTheme.color,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.button,
                  ),
                ],
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
