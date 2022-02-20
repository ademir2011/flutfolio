import 'package:flutfolio/src/models/certification_model.dart';
import 'package:flutfolio/src/models/contact_model.dart';
import 'package:flutfolio/src/models/project_model.dart';
import 'package:flutfolio/src/models/trajectory_model.dart';

class PersonModel {
  final List<ProjectModel> projects;
  final List<TrajectoryModel> trajectories;
  final List<CertificationModel> certifications;
  final ContactModel contact;

  PersonModel({
    required this.projects,
    required this.trajectories,
    required this.certifications,
    required this.contact,
  });
}
