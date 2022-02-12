import 'package:flutfolio/components/ccard.dart';
import 'package:flutfolio/components/ccard_video.dart';
import 'package:flutfolio/components/cproject_image.dart';
import 'package:flutfolio/components/ctag.dart';
import 'package:flutfolio/models/project.dart';
import 'package:flutfolio/models/tags.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final projects = [
      Project(
        title: 'Quiz',
        description: 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        gitUrl: 'http://git.com',
        tags: [Tags(title: 'Container'), Tags(title: 'Colors'), Tags(title: 'Column')],
      ),
      Project(
        title: 'Quiz',
        description: 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        gitUrl: 'http://git.com',
        tags: [Tags(title: 'Container'), Tags(title: 'Colors'), Tags(title: 'Column')],
      ),
      Project(
        title: 'Quiz',
        description: 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        gitUrl: 'http://git.com',
        tags: [Tags(title: 'Container'), Tags(title: 'Colors'), Tags(title: 'Column')],
      ),
      Project(
        title: 'Quiz',
        description: 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        gitUrl: 'http://git.com',
        tags: [Tags(title: 'Container'), Tags(title: 'Colors'), Tags(title: 'Column')],
      ),
    ];

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PROJETOS',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 10),
          const Divider(indent: 0, endIndent: 0, height: 0.5),
          const SizedBox(height: 20),
          Text(
            'Projetos Pessoais',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: size.width < 1200
                      ? Column(
                          children: threeElements(context, projects, index, size),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: threeElements(context, projects, index, size),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> threeElements(BuildContext context, List<Project> projects, int index, Size size) {
    return [
      CCard(
        size: size,
        title: projects[index].title,
        description: projects[index].description,
        tags: projects[index].tags,
        gitUrl: projects[index].gitUrl,
      ),
      CProjectImage(size: size),
      CCardVideo(size: size),
    ];
  }
}
