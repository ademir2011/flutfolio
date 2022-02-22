import 'dart:convert';

class ProjectModel {
  String docRef;
  final String userId;
  final String title;
  final String description;
  final String tags;
  final String gitUrl;
  final String imagesUrl;
  final String videoUrl;

  ProjectModel({
    this.docRef = '',
    required this.userId,
    required this.title,
    required this.description,
    required this.tags,
    required this.gitUrl,
    required this.imagesUrl,
    required this.videoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'docRef': docRef,
      'userId': userId,
      'title': title,
      'description': description,
      'tags': tags,
      'gitUrl': gitUrl,
      'imagesUrl': imagesUrl,
      'videoUrl': videoUrl,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      docRef: map['docRef'] ?? '',
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      tags: map['tags'] ?? '',
      gitUrl: map['gitUrl'] ?? '',
      imagesUrl: map['imagesUrl'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source));
}
