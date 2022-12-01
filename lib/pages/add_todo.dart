import 'package:daily_task/cubit/todo/cubit/todo_cubit.dart';
import 'package:daily_task/models/user_model.dart';
import 'package:daily_task/pages/dashboard_page.dart';
import 'package:daily_task/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatefulWidget {
  AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController todo1 = TextEditingController();
  TextEditingController todo2 = TextEditingController();
  TextEditingController todo3 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height * 16 / 100),
              width: double.infinity,
              child: Stack(children: [
                Container(
                  height: (MediaQuery.of(context).size.height * 100 / 100),
                  width: (MediaQuery.of(context).size.width * 40 / 100),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.topLeft,
                          image: AssetImage("assets/img/circle_design.png"))),
                ),
                Positioned(
                    top: 40,
                    left: -5,
                    child: TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                        )))
              ]),
            ),
            SizedBox(
              height: 45,
            ),
            Text('Welcome Onboard!',
                style: fontStyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Image(
                image: AssetImage('assets/img/animation3.png'),
                height: (MediaQuery.of(context).size.height * 30 / 100),
                width: (MediaQuery.of(context).size.width * 28 / 100),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Add What your want to do later on..',
                style: fontStyle.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: greenColor),
                textAlign: TextAlign.center),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              margin: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height * 2 / 100)),
              width: (MediaQuery.of(context).size.width * 20 / 100),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    controller: todo1,
                    decoration: InputDecoration(
                      hintText: "Type youre todo here ....",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'todo is required';
                      }
                    },
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 3 / 100),
                  ),
                  TextFormField(
                    controller: todo2,
                    decoration: InputDecoration(
                      hintText: "Type youre todo here ....",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'todo is required';
                      }
                    },
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 3 / 100),
                  ),
                  TextFormField(
                    controller: todo3,
                    decoration: InputDecoration(
                      hintText: "Type youre todo here ....",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'todo is required';
                      }
                    },
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 80),
              child: BlocConsumer<TodoCubit, TodoState>(
                listener: (context, state) {
                  if (state is TodoSuccess) {
                    todo1.clear();
                    todo2.clear();
                    todo3.clear();
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Success'),
                            content: SingleChildScrollView(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text('data berhasil di tambahkan')
                              ],
                            )),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Add More')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Go To Dashboard'))
                            ],
                          );
                        });
                  }
                  if (state is TodoFailed) {
                    AlertDialog(
                      content: Text('Failed'),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is TodoLoading) {
                    return SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: greenColor,
                        ),
                      ),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "/dashboard");
                      if (_formKey.currentState!.validate() == true) {
                        context.read<TodoCubit>().addTodo(
                            todo1: todo1.text,
                            todo2: todo2.text,
                            todo3: todo3.text);
                      }
                    },
                    child: Text("Add to list"),
                    style: ElevatedButton.styleFrom(primary: greenColor),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
