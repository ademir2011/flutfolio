import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'PROJETOS',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
