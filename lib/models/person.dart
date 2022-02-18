import 'package:flutfolio/models/certification.dart';
import 'package:flutfolio/models/contact.dart';
import 'package:flutfolio/models/project.dart';
import 'package:flutfolio/models/trajectory.dart';

class Person {
  final List<Project> projects;
  final List<Trajectory> trajectories;
  final List<Certification> certifications;
  final Contact contact;

  Person({
    required this.projects,
    required this.trajectories,
    required this.certifications,
    required this.contact,
  });
}
