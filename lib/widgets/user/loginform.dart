import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("이메일",
                    style: TextStyle(fontFamily: "Youth", fontSize: 20)),
                Container(
                  width: 200,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "email@email.com",
                    ),
                    controller: emailController,
                    onChanged: (email) {},
                    validator: (email) {
                      if (email.isEmpty) {
                        return '이메일을 입력해주세요.';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("비밀번호",
                    style: TextStyle(fontFamily: "Youth", fontSize: 20)),
                Container(
                  width: 200,
                  child: TextFormField(
                    controller: passController,
                    obscureText: true,
                    onChanged: (password) {
                      setState(() {});
                    },
                    validator: (password) {
                      if (password.isEmpty) {
                        return '비밀번호를 입력해주세요.';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
