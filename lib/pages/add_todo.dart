import 'package:daily_task/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
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
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height * 3 / 100),
                ),
                TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    textInputAction: TextInputAction.next),
                SizedBox(
                  height: (MediaQuery.of(context).size.height * 3 / 100),
                ),
                TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    textInputAction: TextInputAction.done),
              ]),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 80),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/dashboard");
                },
                child: Text("Add to list"),
                style: ElevatedButton.styleFrom(primary: greenColor),
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
