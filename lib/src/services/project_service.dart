import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutfolio/src/models/project_model.dart';

class ProjectService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProject(ProjectModel project) async {
    CollectionReference projectsCollection = firestore.collection('projects');
    if (FirebaseAuth.instance.currentUser != null) {
      await projectsCollection.add(project.toMap()).then((value) async {
        return await value.update({'docRef': value.id});
      });
    } else {
      throw FirebaseAuthException(code: 'Usuário não logado!');
    }
  }

  Future<QuerySnapshot<Object?>> projectByDefault() async {
    CollectionReference projectsCollection = firestore.collection('projects');
    return await projectsCollection.where('userId', isEqualTo: 'T42nJyLz5reZ0Frxfs1mJbVhc0o1').get();
  }

  Future<void> removeDefault(String docRef) async {
    CollectionReference projectsCollection = firestore.collection('projects');
    await projectsCollection.doc(docRef).delete();
  }

  Future<void> updateDefault(String docRef, ProjectModel project) async {
    CollectionReference projectsCollection = firestore.collection('projects');
    await projectsCollection.doc(docRef).update(project.toMap());
  }

  Future<DocumentSnapshot<Object?>> getProjectByDocRef(String docRef) async {
    CollectionReference projectsCollection = firestore.collection('projects');
    return await projectsCollection.doc(docRef).get();
  }
}
