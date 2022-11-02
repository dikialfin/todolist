import 'package:daily_task/themes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter your email address'),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height * 3 / 100),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Password'),
                  obscureText: true,
                ),
              ]),
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
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/add_todo", (route) => false);
                },
                child: Text("Sign In"),
                style: ElevatedButton.styleFrom(primary: greenColor),
              ),
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
