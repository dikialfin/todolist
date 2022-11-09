import 'package:bloc/bloc.dart';
import 'package:daily_task/models/user_model.dart';
import 'package:daily_task/services/auth_service.dart';
import 'package:daily_task/services/user_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool validatePassword(
      {required String password, required String confirmPassword}) {
    if (password == null || password == '') {
      emit(AuthFailed('password is required'));
      return false;
    }
    if (password != confirmPassword) {
      emit(AuthFailed('password not match'));
      return false;
    }
    if (password.length < 5) {
      emit(AuthFailed('password to short'));
      return false;
    }

    return true;
  }

  bool validateName({required String name}) {
    if (name == null || name == '') {
      emit(AuthFailed('name is required'));
      return false;
    }

    if (name.length < 2) {
      emit(AuthFailed('name to short'));
      return false;
    }

    return true;
  }

  void register({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      emit(AuthLoading());

      if (validateName(name: name)) {
        if (validatePassword(
            password: password, confirmPassword: confirmPassword)) {
          UserModel userdata = await AuthService()
              .register(fullname: name, email: email, password: password);
          emit(AuthSuccess(userdata));
        }
      }

      // UserModel userData = await AuthService()
      //     .register(email: email, fullname: name, password: password);
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(e.message.toString()));
    }
  }
}
