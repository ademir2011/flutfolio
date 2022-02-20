import 'package:flutter/material.dart';

class TimeLineTImeLineWidget extends StatelessWidget {
  final int index;
  final String year;
  const TimeLineTImeLineWidget({
    Key? key,
    required this.index,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (index % 2 == 0)
              Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
              ),
            if (index % 2 == 0) const SizedBox(width: 5),
            Text(
              year,
              style: Theme.of(context).textTheme.headline2,
            ),
            if (index % 2 == 1) const SizedBox(width: 5),
            if (index % 2 == 1)
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor,
              ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
