import 'package:flutfolio/models/project_image.dart';
import 'package:flutfolio/utils/image_helper.dart';
import 'package:flutter/material.dart';

class CProjectImage extends StatefulWidget {
  final List<ProjectImage> projectImages;

  const CProjectImage({
    Key? key,
    required this.projectImages,
  }) : super(key: key);

  @override
  State<CProjectImage> createState() => _CProjectImageState();
}

class _CProjectImageState extends State<CProjectImage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_selectedIndex != 0)
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex--;
                });
              },
            ),
          Image.network(
            widget.projectImages[_selectedIndex].urlImage,
          ),
          if (_selectedIndex != widget.projectImages.length - 1)
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex++;
                });
              },
            ),
        ],
      ),
    );
  }
}
