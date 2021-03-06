import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String desc;

  TaskCardWidget({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "(Unnamed Task)",
            style: TextStyle(
              color: Color(0xFF081132),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              desc ?? "No Description added",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String text;
  final bool isDone;

  TodoWidget({this.text, this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(
              right: 12.0,
            ),
            decoration: BoxDecoration(
              color: isDone ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: isDone ? null : Border.all(
                      color: Colors.black,
                    ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.9),
              child: Image(
                color: isDone ? Colors.white : Colors.transparent,
                  image: AssetImage('assets/images/check_icon.png')),
            ),
          ),
          Flexible(
            child: Text(
              text ?? "Unnamed Todo",
              style: TextStyle(
                color: isDone ? Colors.black : Colors.black45,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
