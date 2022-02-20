import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String iconUrl;
  final String text;
  final Function() onPressed;

  const ButtonWidget({
    Key? key,
    required this.iconUrl,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onHover: (isHover) {},
        child: Row(
          children: [
            ImageIcon(
              AssetImage(iconUrl),
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
