import 'package:flutfolio/src/widgets/card_generic_widget.dart';
import 'package:flutter/material.dart';

class ContactTileWidget extends StatelessWidget {
  final String iconUrl;
  final List<String> textLines;
  const ContactTileWidget({
    Key? key,
    required this.iconUrl,
    required this.textLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(iconUrl),
            size: 40,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 50),
          CardGenericWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                textLines.length,
                (index) {
                  return Text(
                    textLines[index],
                    style: Theme.of(context).textTheme.headline3,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
