import 'package:daily_task/pages/add_todo.dart';
import 'package:daily_task/pages/dashboard_page.dart';
import 'package:daily_task/pages/login_page.dart';
import 'package:daily_task/pages/register_page.dart';
import 'package:daily_task/pages/started_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Task App',
      routes: {
        '/': (context) => StartedPage(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/add_todo': (context) => AddTodoPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}
