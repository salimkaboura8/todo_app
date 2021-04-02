import 'package:flutter/material.dart';
import 'package:todo_app/screens/taskpage.dart';
import 'package:todo_app/widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(32.0),
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 32,
                    bottom: 32.0,
                  ),
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      TaskCardWidget(
                        title: "Get Started!",
                        desc: "I'm passing this description from the homepage.dart",
                      ),
                      TaskCardWidget(),
                      TaskCardWidget(),
                      TaskCardWidget(),
                      TaskCardWidget(),
                      TaskCardWidget(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Taskpage()
                    ),
                  );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF3FC495),
                  ),
                  child: Image(
                    image: AssetImage(
                      'assets/images/add_icon.png',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
