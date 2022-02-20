import 'package:flutfolio/src/models/project_model.dart';
import 'package:flutfolio/src/widgets/card_video_widget.dart';
import 'package:flutfolio/src/widgets/card_widget.dart';
import 'package:flutfolio/src/widgets/header_widget.dart';
import 'package:flutfolio/src/widgets/project_image_widget.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  final List<ProjectModel> projects;
  const ProjectsPage({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWidget(title: 'PROJETOS'),
        Expanded(
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (ctx, index) {
              return Container(
                height: 450,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: CardWidget(
                        title: projects[index].title,
                        description: projects[index].description,
                        tags: projects[index].tags,
                        gitUrl: projects[index].gitUrl,
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: ProjectImageWidget(
                          projectImages: projects[index].projectImages,
                        )),
                    Flexible(
                      flex: 3,
                      child: CardVideoWidget(
                        videoUrl: projects[index].videoUrl,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
