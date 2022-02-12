import 'package:flutter/material.dart';

class CCardVideo extends StatelessWidget {
  final Size? size;
  const CCardVideo({
    Key? key,
    this.size,
  }) : super(key: key);

  double getWidth(Size? size) {
    if (size == null) return 500;

    if (size.width < 1200) {
      return double.infinity;
    } else if (size.width < 1400) {
      return 275;
    } else if (size.width < 1600) {
      return 325;
    } else if (size.width < 1800) {
      return 425;
    } else {
      return 450;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(size),
      height: 300,
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
    );
  }
}
