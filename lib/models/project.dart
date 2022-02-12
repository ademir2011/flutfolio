import 'package:flutfolio/models/project_image.dart';
import 'package:flutfolio/models/tags.dart';

class Project {
  final String title;
  final String description;
  final List<Tags> tags;
  final String gitUrl;
  final List<ProjectImage> projectImages;
  final String videoUrl;

  Project({
    required this.title,
    required this.description,
    this.tags = const [],
    this.gitUrl = '',
    this.projectImages = const [],
    this.videoUrl = '',
  });
}
