import 'package:flutfolio/src/models/project_image_model.dart';
import 'package:flutfolio/src/models/tags_model.dart';

class ProjectModel {
  final String title;
  final String description;
  final List<TagsModel> tags;
  final String gitUrl;
  final List<ProjectImageModel> projectImages;
  final String videoUrl;

  ProjectModel({
    required this.title,
    required this.description,
    this.tags = const [],
    this.gitUrl = '',
    this.projectImages = const [],
    this.videoUrl = '',
  });
}
