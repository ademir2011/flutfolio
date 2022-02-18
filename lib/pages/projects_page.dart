import 'package:flutfolio/components/ccard.dart';
import 'package:flutfolio/components/ccard_video.dart';
import 'package:flutfolio/components/cheader.dart';
import 'package:flutfolio/components/cproject_image.dart';
import 'package:flutfolio/models/project.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  final List<Project> projects;
  const ProjectsPage({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CHeader(title: 'PROJETOS'),
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
                      child: CCard(
                        title: projects[index].title,
                        description: projects[index].description,
                        tags: projects[index].tags,
                        gitUrl: projects[index].gitUrl,
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: CProjectImage(
                          projectImages: projects[index].projectImages,
                        )),
                    Flexible(
                      flex: 3,
                      child: CCardVideo(
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
