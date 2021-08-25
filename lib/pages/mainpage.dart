import 'package:acquaintance/pages/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(),
            Text(
              "This Week",
              style: TextStyle(fontFamily: "Youth", fontSize: 20),
            ),
            Row(),
            Table(),
          ],
        ),
      ),
    );
  }
}
