import 'package:daily_task/pages/dashboard_page.dart';
import 'package:daily_task/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/Password/password_cubit.dart';
import '../cubit/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
            Text('Welcome Back!',
                style: fontStyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center),
            SizedBox(
              height: 20,
            ),
            Image(
              image: AssetImage('assets/img/animation2.png'),
              height: (MediaQuery.of(context).size.height * 30 / 100),
              width: (MediaQuery.of(context).size.width * 28 / 100),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              margin: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height * 2 / 100)),
              width: (MediaQuery.of(context).size.width * 20 / 100),
              child: Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter your email address'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        final String emailRegex =
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

                        if (value == null || value == '') {
                          return 'Email is required';
                        }

                        if (RegExp(emailRegex).hasMatch(value) == false) {
                          return 'Email not valid';
                        }
                      },
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * 3 / 100),
                    ),
                    BlocBuilder<PasswordCubit, bool>(builder: (context, state) {
                      final iconPassword = state == true
                          ? Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.visibility,
                              color: Colors.black,
                            );

                      return TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  context
                                      .read<PasswordCubit>()
                                      .passwordVisible();
                                },
                                icon: iconPassword),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter your password'),
                        textInputAction: TextInputAction.done,
                        obscureText: state,
                        validator: (value) {
                          if (value == "" || value == null) {
                            return "Password is required";
                          } else if (value.length < 5) {
                            return "Password to short";
                          }
                        },
                      );
                    }),
                  ])),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Forgot Password?',
              style: fontStyle.copyWith(
                  fontSize: 13, fontWeight: FontWeight.w500, color: greenColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 80),
              child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                if (state is AuthSuccess) {
                  _email.clear();
                  _password.clear();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DashboardPage(userData: state.userData)),
                      (route) => false);
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ));
                }
              }, builder: (context, state) {
                if (state is AuthLoading) {
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
                    if (_formKey.currentState!.validate() == true) {
                      context
                          .read<AuthCubit>()
                          .login(email: _email.text, password: _password.text);
                    }
                  },
                  child: Text("Sign In"),
                  style: ElevatedButton.styleFrom(primary: greenColor),
                );
              }),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have an account?",
                  style: fontStyle.copyWith(fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Text("Sign Up",
                      style:
                          fontStyle.copyWith(fontSize: 15, color: greenColor)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
