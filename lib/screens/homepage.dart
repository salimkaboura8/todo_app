import 'package:flutter/material.dart';
import 'package:todo_app/screens/taskpage.dart';
import 'package:todo_app/widgets.dart';

import '../database_helper.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 25,
                    bottom: 0,
                  ),
                  child: Image(
                    width: 50.0,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    initialData: [],
                    future: _dbHelper.getTasks(),
                    builder: (context, snapshot) {
                      return ScrollConfiguration(
                        behavior: NoGlowBehaviour(),
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Taskpage(
                                            task: snapshot.data[index],
                                          )),
                                ).then((value) {
                                  setState(() {});
                                });
                              },
                              child: TaskCardWidget(
                                title: snapshot.data[index].title,
                                desc: snapshot.data[index].description,
                              ),
                            );
                          },
                        ),
                      );
                    },
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
                        builder: (context) => Taskpage(
                              task: null,
                            )),
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [Color(0xFF68A0DE), Color(0xFF3878AA)],
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 1.0)),
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
