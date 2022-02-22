import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutfolio/src/models/project_model.dart';
import 'package:flutfolio/src/pages/form_project_page.dart';
import 'package:flutfolio/src/stores/auth_store.dart';
import 'package:flutfolio/src/stores/project_store.dart';
import 'package:flutfolio/src/widgets/card_generic_widget.dart';
import 'package:flutfolio/src/widgets/card_widget.dart';
import 'package:flutfolio/src/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProjectsPage extends StatelessWidget {
  final authStore = GetIt.I<AuthStore>();
  final projectStore = ProjectStore();
  ProjectsPage({Key? key}) : super(key: key);

  Future<void> _showMyDialog(context, {String? docRef}) async {
    return showDialog<void>(
      context: context,
      builder: (ctx) {
        return FormProjectPage(docRef: docRef);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderWidget(title: 'PROJETOS'),
            authStore.isAuthenticate
                ? Row(
                    children: [
                      CardGenericWidget(
                        child: IconButton(
                          onPressed: () {
                            _showMyDialog(context);
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ),
                      const SizedBox(width: 25),
                      CardGenericWidget(
                        child: IconButton(
                          onPressed: () {
                            authStore.logout();
                            Navigator.of(context).pushReplacementNamed('/');
                          },
                          icon: const Icon(Icons.keyboard_return),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
        const SizedBox(height: 20),
        FutureBuilder<QuerySnapshot<Object?>>(
          future: projectStore.projectByDefault(),
          builder: (ctx, snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<ProjectModel> projects = snapshot.data!.docs.map((projectModelMap) {
                return ProjectModel.fromMap(projectModelMap.data() as Map<String, dynamic>);
              }).toList();
              return Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 550,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (ctx, index) {
                    return CardWidget(
                      updateFunction: () {
                        _showMyDialog(
                          context,
                          docRef: projects[index].docRef,
                        );
                      },
                      cardId: projects[index].docRef,
                      title: projects[index].title,
                      description: projects[index].description,
                      tags: projects[index].tags,
                      gitUrl: projects[index].gitUrl,
                      isAutenticated: authStore.isAuthenticate,
                    );
                  },
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
