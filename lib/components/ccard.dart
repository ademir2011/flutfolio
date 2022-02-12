import 'package:flutfolio/components/ctag.dart';
import 'package:flutfolio/models/project.dart';
import 'package:flutfolio/models/tags.dart';
import 'package:flutter/material.dart';

class CCard extends StatelessWidget {
  final Size? size;
  final String title;
  final String description;
  final List<Tags> tags;
  final String gitUrl;

  const CCard({
    Key? key,
    this.size,
    required this.title,
    required this.description,
    this.tags = const [],
    this.gitUrl = '',
  }) : super(key: key);

  double getWidth(Size? size) {
    if (size == null) return 500;

    if (size.width < 1200) {
      return double.infinity;
    } else if (size.width < 1400) {
      return 300;
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
      height: 300,
      width: getWidth(size),
      padding: const EdgeInsets.all(30),
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
          Row(
            children: [
              const Icon(Icons.gite_outlined),
              const SizedBox(width: 15),
              TextButton(
                child: Text(gitUrl),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
