import 'package:flutfolio/components/ctag.dart';
import 'package:flutfolio/models/tags.dart';
import 'package:flutfolio/utils/icon_helper.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

class CCard extends StatelessWidget {
  final String title;
  final String description;
  final List<Tags> tags;
  final String gitUrl;

  const CCard({
    Key? key,
    required this.title,
    required this.description,
    this.tags = const [],
    this.gitUrl = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Text(
              description,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          const Divider(indent: 0, endIndent: 0, height: 0.5),
          const SizedBox(height: 10),
          Row(
            children: tags
                .map((tag) => CTag(
                      title: tag.title,
                    ))
                .toList(),
          ),
          const SizedBox(height: 10),
          const Divider(indent: 0, endIndent: 0, height: 0.5),
          const SizedBox(height: 10),
          IconButton(
            icon: ImageIcon(
              AssetImage(
                IconHelper.getPath(IconName.github),
              ),
            ),
            onPressed: () {
              js.context.callMethod('open', [gitUrl]);
            },
          ),
        ],
      ),
    );
  }
}
