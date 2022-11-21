import 'package:bloc/bloc.dart';
import 'package:daily_task/models/user_model.dart';
import 'package:daily_task/services/auth_service.dart';
import 'package:daily_task/services/user_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void register({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      emit(AuthLoading());

      UserModel userdata = await AuthService()
          .register(fullname: name, email: email, password: password);
      emit(AuthSuccess(userdata));

      // UserModel userData = await AuthService()
      //     .register(email: email, fullname: name, password: password);
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(e.message.toString()));
    }
  }
}
