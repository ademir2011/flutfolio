import 'package:flutfolio/src/models/project_image_model.dart';
import 'package:flutter/material.dart';

class ProjectImageWidget extends StatefulWidget {
  final List<ProjectImageModel> projectImages;

  const ProjectImageWidget({
    Key? key,
    required this.projectImages,
  }) : super(key: key);

  @override
  State<ProjectImageWidget> createState() => _ProjectImageStateWidget();
}

class _ProjectImageStateWidget extends State<ProjectImageWidget> {
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
