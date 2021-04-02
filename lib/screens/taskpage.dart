import 'package:flutter/material.dart';
import 'package:todo_app/widgets.dart';

class Taskpage extends StatefulWidget {
  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        print("Clicked the back button");
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image(
                          image:
                              AssetImage('assets/images/back_arrow_icon.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Task Title",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xF40E0E2B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Description for the task...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              TodoWidget(
                text: "Create your first Task",
                isDone: false,
              ),
              TodoWidget(
                text: "Create your first Task",
                isDone: true,
              ),
              TodoWidget(
                text: "Create your first Task",
                isDone: false,
              ),
              TodoWidget(
                text: "Create your first Task",
                isDone: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
