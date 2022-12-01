import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:daily_task/services/user_service.dart';
import 'package:equatable/equatable.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  void addTodo({
    required String todo1,
    required String todo2,
    required String todo3,
  }) async {
    emit(TodoLoading());

    final isSuccess =
        await UserService().addTodo(todoData: [todo1, todo2, todo3]);

    if (isSuccess) {
      emit(TodoSuccess());
    } else {
      emit(TodoFailed());
    }
    // var data = [todo1, todo2, todo3];
    // print(data);

    // Timer(Duration(seconds: 5), () {
    //   emit(TodoSuccess());
    // });
  }
}
