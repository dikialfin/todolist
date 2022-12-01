import 'package:daily_task/models/user_model.dart';
import 'package:daily_task/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel> register(
      {required String fullname,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel userData = UserModel(
          uid: userCredential.user!.uid, name: fullname, email: email);

      await UserService().createUser(userData: userData);

      return userData;
    } catch (e) {
      throw e;
    }
  }

  Future<String> getcurrentUserId() async {
    try {
      var userUid = await _firebaseAuth.currentUser!.uid;

      return userUid;
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  Future<UserModel> login(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    UserModel userData =
        await UserService().getUserById(id: userCredential.user!.uid);
    return userData;
  }

  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      throw e;
    }
  }
}
