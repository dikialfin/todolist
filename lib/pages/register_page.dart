import 'package:daily_task/themes.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SafeArea(
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
                height: 20,
              ),
              Text('Let’s help you meet up your task',
                  style: fontStyle.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: greenColor),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 20,
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
                        hintText: 'Enter your full name'),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 3 / 100),
                  ),
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'enter your email address')),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 3 / 100),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Create a Password'),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 3 / 100),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Confirm your Password'),
                    obscureText: true,
                  ),
                ]),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 80),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/add_todo", (route) => false);
                  },
                  child: Text("Sign Up"),
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
                    "Already have an account ?",
                    style: fontStyle.copyWith(fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Text("Sign In",
                        style: fontStyle.copyWith(
                            fontSize: 15, color: greenColor)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
