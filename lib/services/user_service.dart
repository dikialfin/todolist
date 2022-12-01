import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_task/models/user_model.dart';
import 'package:daily_task/services/auth_service.dart';
import 'package:flutter/rendering.dart';

class UserService {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  CollectionReference usersTodoCollection =
      FirebaseFirestore.instance.collection('users_todo');

  Future<void> createUser({required UserModel userData}) async {
    try {
      userCollection.doc(userData.uid).set({
        'uid': userData.uid,
        'name': userData.name,
        'email': userData.email,
      });
    } catch (e) {}
  }

  Future<UserModel> getUserById({required String id}) async {
    try {
      DocumentSnapshot userData = await userCollection.doc(id).get();
      return UserModel(
          uid: id, name: userData['name'], email: userData['email']);
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  Future<bool> addTodo({required List<String> todoData}) async {
    try {
      String userId = await AuthService().getcurrentUserId();

      // await usersTodoCollection.doc(userId).set({
      //   'todo': {todoData[0]: {}, todoData[1]: {}, todoData[2]: {}}
      // });

      // await usersTodoCollection.doc(userId).set({
      //   'todo': {todoData[0]: {}, todoData[1]: {}, todoData[2]: {}}
      // });

      await usersTodoCollection
          .doc(userId)
          .collection(todoData[0])
          .doc('date')
          .set({'date': {}}).then((value) {
        usersTodoCollection
            .doc(userId)
            .collection(todoData[1])
            .doc('date')
            .set({'date': {}}).then((value) {
          usersTodoCollection
              .doc(userId)
              .collection(todoData[2])
              .doc('date')
              .set({'date': {}});
        });
      });

      return true;
    } on FirebaseException catch (e) {
      throw e;
    }
  }
}
