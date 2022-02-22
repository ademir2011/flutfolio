import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutfolio/src/models/project_model.dart';
import 'package:flutfolio/src/services/project_service.dart';
import 'package:flutter/cupertino.dart';

class ProjectStore {
  ProjectService projectService = ProjectService();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final tagsController = TextEditingController();
  final githubLinkController = TextEditingController();
  final imagesLinkController = TextEditingController();
  final videosLinkController = TextEditingController();

  String? titleValidate(String? value) {
    final _value = value ?? '';
    if (_value.isEmpty) {
      return 'Vazio';
    }
    return null;
  }

  String? descriptionValidate(String? value) {
    final _value = value ?? '';
    if (_value.isEmpty) {
      return 'Vazio';
    }
    return null;
  }

  String? tagsValidate(String? value) {
    final _value = value ?? '';
    if (_value.isEmpty) {
      return 'Vazio';
    }
    return null;
  }

  String? linkValidate(String? value) {
    final _value = value ?? '';
    if (_value.isEmpty) {
      return 'Vazio';
    }
    return null;
  }

  Future<void> addProject() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final projectModel = ProjectModel(
        userId: FirebaseAuth.instance.currentUser!.uid,
        title: titleController.text,
        description: descriptionController.text,
        gitUrl: githubLinkController.text,
        imagesUrl: imagesLinkController.text,
        videoUrl: videosLinkController.text,
        tags: tagsController.text,
      );
      await projectService.addProject(projectModel);
    }
  }

  void initUpdate(String docRef) {
    getProjectByDocRef(docRef).then((value) {
      ProjectModel project = ProjectModel.fromMap(value.data() as Map<String, dynamic>);
      titleController.text = project.title;
      descriptionController.text = project.description;
      tagsController.text = project.tags;
      githubLinkController.text = project.gitUrl;
      imagesLinkController.text = project.imagesUrl;
      videosLinkController.text = project.videoUrl;
    });
  }

  Future<DocumentSnapshot<Object?>> getProjectByDocRef(String docRef) {
    return projectService.getProjectByDocRef(docRef);
  }

  Future<QuerySnapshot<Object?>> projectByDefault() async {
    return await projectService.projectByDefault();
  }

  Future<void> removeDefault(String docRef) async {
    return await projectService.removeDefault(docRef);
  }
}
