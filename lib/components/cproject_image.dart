import 'package:flutter/material.dart';

class CProjectImage extends StatelessWidget {
  final Size? size;
  const CProjectImage({
    Key? key,
    this.size,
  }) : super(key: key);

  double getWidth(Size? size) {
    if (size == null)
      return 500;
    else if (size.width < 1400) {
      return 125;
    }
    if (size.width < 1600) {
      return 150;
    } else if (size.width < 1800) {
      return 200;
    } else {
      return 300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/226/226770.png',
            width: getWidth(size),
            // fit: BoxFit.contain,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
