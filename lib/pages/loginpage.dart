import 'package:acquaintance/widgets/user/loginform.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            child: Column(
              children: <Widget>[
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
