import 'package:bloc/bloc.dart';
import 'package:daily_task/models/user_model.dart';
import 'package:daily_task/services/auth_service.dart';
import 'package:daily_task/services/user_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConfirmPasswordCubit extends Cubit<bool> {
  ConfirmPasswordCubit() : super(true);

  void confirmPasswordVisible() {
    if (state == false) {
      emit(true);
    } else if (state == true) {
      emit(false);
    }
  }
}
