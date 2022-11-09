import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_task/models/user_model.dart';
import 'package:flutter/rendering.dart';

class UserService {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<void> createUser({required UserModel userData}) async {
    try {
      userCollection.doc(userData.uid).set({
        'uid': userData.uid,
        'name': userData.name,
        'email': userData.email,
      });
    } catch (e) {}
  }
}
