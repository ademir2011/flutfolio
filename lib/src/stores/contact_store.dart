import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutfolio/src/models/contact_model.dart';
import 'package:flutfolio/src/services/contact_service.dart';
import 'package:flutter/cupertino.dart';

class ContactStore extends ChangeNotifier {
  final contactFormKey = GlobalKey<FormState>();
  final contactService = ContactService();

  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final phoneController = TextEditingController();
  final githubLinkController = TextEditingController();
  final linkedinController = TextEditingController();

  bool isLoading = false;

  String? emptyValidator(String? value) {
    final _value = value ?? '';
    if (_value.isEmpty) {
      return 'Vazio';
    }
    return null;
  }

  String? nameValidate(String? value) {
    return emptyValidator(value);
  }

  String? birthDateValidate(String? value) {
    return emptyValidator(value);
  }

  String? cityValidate(String? value) {
    return emptyValidator(value);
  }

  String? stateValidate(String? value) {
    return emptyValidator(value);
  }

  String? phoneValidate(String? value) {
    return emptyValidator(value);
  }

  String? githubLinkValidate(String? value) {
    return emptyValidator(value);
  }

  String? linkedinValidate(String? value) {
    return emptyValidator(value);
  }

  ContactModel createModel() {
    return ContactModel(
      name: nameController.text,
      docRef: '',
      userId: '',
      birthDate: DateTime.parse(birthDateController.text).toIso8601String(),
      state: stateController.text,
      city: cityController.text,
      number: phoneController.text,
      githubUrl: githubLinkController.text,
      linkedinUrl: linkedinController.text,
    );
  }

  Future<void> addContact() async {
    final contactModel = createModel();

    return await contactService.addContact(contactModel).then((value) {
      notifyListeners();
    });
  }

  Future<QuerySnapshot<Object?>> getContactDefaultUser() async {
    return await contactService.getContactDefaultUser();
  }

  Future<void> removeByDodRef(String docRef) async {
    return await contactService.removeByDodRef(docRef).then((value) {
      notifyListeners();
    });
  }

  Future<void> updateByDocRef(String docRef) async {
    final contactModel = createModel();
    return await contactService.updateByDocRef(docRef: docRef, contact: contactModel).then((value) {
      notifyListeners();
    });
  }

  void initFields(String docRef) {
    getContactDefaultUser().then((value) {
      final contactModel = ContactModel.fromMap(value.docs.first.data() as Map<String, dynamic>);
      nameController.text = contactModel.name;
      birthDateController.text = contactModel.birthDate;
      cityController.text = contactModel.city;
      stateController.text = contactModel.state;
      phoneController.text = contactModel.number;
      githubLinkController.text = contactModel.githubUrl;
      linkedinController.text = contactModel.linkedinUrl;
    });
  }

  void clear() {
    nameController.text = '';
    birthDateController.text = '';
    cityController.text = '';
    stateController.text = '';
    phoneController.text = '';
    githubLinkController.text = '';
    linkedinController.text = '';
  }

  void toogleLoading() {
    isLoading = !isLoading;
  }

  void onDialogEdit({required String docRef}) async {
    if (contactFormKey.currentState!.validate()) {
      await updateByDocRef(docRef);
    }
  }

  void onDialogDelete({required String docRef}) async {}
}
