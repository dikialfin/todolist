import 'package:daily_task/custom_clipper.dart';
import 'package:daily_task/models/user_model.dart';
import 'package:daily_task/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';

class DashboardPage extends StatelessWidget {
  final UserModel userData;
  const DashboardPage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: MediaQuery.of(context).size.height * 72 / 100,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.height * 40 / 100),
                      decoration:
                          BoxDecoration(color: greenColor.withOpacity(0.8)),
                      child: Stack(children: [
                        Container(
                          width: (MediaQuery.of(context).size.width * 35 / 100),
                          height:
                              (MediaQuery.of(context).size.height * 15 / 100),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  alignment: Alignment.topLeft,
                                  image: AssetImage(
                                      'assets/img/circle_design.png'))),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width:
                                (MediaQuery.of(context).size.width * 35 / 100),
                            height:
                                (MediaQuery.of(context).size.height * 15 / 100),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/img/user_img.png'))),
                          ),
                        ),
                        Positioned(
                            top: 200,
                            left:
                                (MediaQuery.of(context).size.width * 20 / 100),
                            child: Container(
                              width: (MediaQuery.of(context).size.width *
                                  60 /
                                  100),
                              child: Text('Welcome ${userData.name}',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: fontStyle.copyWith(
                                      fontWeight: medium, fontSize: 20)),
                            ))
                      ]),
                    ),
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.height * 36 / 100),
                    left: (MediaQuery.of(context).size.width * 27 / 100),
                    child: Image(
                      image: AssetImage("assets/img/animation5.png"),
                      width: (MediaQuery.of(context).size.width * 55 / 100),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Todo Tasks.",
                    style: fontStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: 210,
                    padding: EdgeInsets.only(left: 31, right: 33, top: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.75),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(0, 4))
                        ]),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dairy Task",
                              style: fontStyle.copyWith(
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(0.50)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/add_todo");
                              },
                              child: Icon(Icons.add_circle_rounded),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Container(
                          height: 130,
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading:
                                      Icon(Icons.check_box, color: greenColor),
                                  title: Text(
                                    "Washing Motorcycle",
                                    style: fontStyle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ),
                                  trailing: Icon(Icons.delete),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 80),
                      child: BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                        if (state is AuthSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
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
                            context.read<AuthCubit>().logout();
                          },
                          child: Text(
                            "Sign Out",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
