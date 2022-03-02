import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutfolio/src/models/contact_model.dart';

class ContactService {
  final firestore = FirebaseFirestore.instance;

  Future<void> addContact(ContactModel contactModel) async {
    CollectionReference contactCollection = firestore.collection('contacts');
    if (FirebaseAuth.instance.currentUser != null) {
      contactModel.userId = FirebaseAuth.instance.currentUser!.uid;
      contactCollection.add(contactModel.toMap()).then((value) async {
        return await value.update({'docRef': value.id});
      });
    }
  }

  Future<QuerySnapshot<Object?>> getContactDefaultUser() async {
    CollectionReference contactCollection = firestore.collection('contacts');
    return await contactCollection.where('userId', isEqualTo: 'T42nJyLz5reZ0Frxfs1mJbVhc0o1').get();
  }

  Future<void> removeByDodRef(String docRef) async {
    if (FirebaseAuth.instance.currentUser != null) {
      CollectionReference contactCollection = firestore.collection('contacts');
      return await contactCollection.doc(docRef).delete();
    }
  }

  Future<void> updateByDocRef({required String docRef, required ContactModel contact}) async {
    if (FirebaseAuth.instance.currentUser != null) {
      CollectionReference contactCollection = firestore.collection('contacts');
      contact.docRef = docRef;
      contact.userId = FirebaseAuth.instance.currentUser!.uid;
      return await contactCollection.doc(docRef).update(contact.toMap());
    }
  }
}
