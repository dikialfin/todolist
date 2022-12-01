import 'package:daily_task/pages/login_page.dart';
import 'package:daily_task/themes.dart';
import 'package:flutter/material.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(children: [
          Container(
            width: (MediaQuery.of(context).size.width * 35 / 100),
            height: (MediaQuery.of(context).size.height * 15 / 100),
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topLeft,
                    image: AssetImage('assets/img/circle_design.png'))),
          ),
          // content
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width * 85 / 100),
                  height: (MediaQuery.of(context).size.height * 30 / 100),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage('assets/img/animation1.png'))),
                ),
                Text(
                  'Get things done with TODo',
                  style: fontStyle.copyWith(fontSize: 20, fontWeight: medium),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height * 3 / 100)),
                  width: (MediaQuery.of(context).size.width * 50 / 100),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipisicing. Maxime, tempore! Animi nemo aut atque, deleniti nihil dolorem repellendus.',
                    style: fontStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                  bottom: (MediaQuery.of(context).size.height * 5 / 100)),
              width: (MediaQuery.of(context).size.width * 65 / 100),
              height: (MediaQuery.of(context).size.width * 10 / 100),
              color: greenColor,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
                  },
                  child: Text(
                    'Get Started',
                    style:
                        fontStyle.copyWith(fontSize: 14, color: Colors.white),
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
