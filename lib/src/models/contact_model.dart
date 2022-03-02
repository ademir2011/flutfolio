import 'dart:convert';

class ContactModel {
  String docRef;
  String userId;
  final String name;
  final String birthDate;
  final String state;
  final String city;
  final String number;
  final String githubUrl;
  final String linkedinUrl;
  ContactModel({
    required this.name,
    this.docRef = '',
    this.userId = '',
    required this.birthDate,
    required this.state,
    required this.city,
    required this.number,
    required this.githubUrl,
    required this.linkedinUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'docRef': docRef,
      'userId': userId,
      'birthDate': birthDate,
      'state': state,
      'city': city,
      'number': number,
      'githubUrl': githubUrl,
      'linkedinUrl': linkedinUrl,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      name: map['name'] ?? '',
      docRef: map['docRef'] ?? '',
      userId: map['userId'] ?? '',
      birthDate: map['birthDate'],
      state: map['state'] ?? '',
      city: map['city'] ?? '',
      number: map['number'] ?? '',
      githubUrl: map['githubUrl'] ?? '',
      linkedinUrl: map['linkedinUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) => ContactModel.fromMap(json.decode(source));
}
