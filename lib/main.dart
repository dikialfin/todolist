import 'package:daily_task/cubit/auth_cubit.dart';
import 'package:daily_task/pages/add_todo.dart';
import 'package:daily_task/pages/dashboard_page.dart';
import 'package:daily_task/pages/login_page.dart';
import 'package:daily_task/pages/register_page.dart';
import 'package:daily_task/pages/started_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Daily Task App',
          routes: {
            '/': (context) => StartedPage(),
            '/register': (context) => RegisterPage(),
            '/login': (context) => LoginPage(),
            '/add_todo': (context) => AddTodoPage(),
            '/dashboard': (context) => DashboardPage(),
          },
        ));
  }
}
