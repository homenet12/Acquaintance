import 'package:acquaintance/models/user.dart';
import 'package:acquaintance/pages/mainpage.dart';
import 'package:acquaintance/services/user/userservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final UserService userService = new UserService();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            onChanged: (email) {
              setState(() {
                //emailController.text = email;
              });
            },
            validator: (email) {
              if (email.isEmpty) {
                return '이메일을 입력해주세요.';
              }
              return null;
            },
          ),
          TextFormField(
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
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                String email = emailController.text;
                String password = passController.text;
                print(email);
                print(password);

                bool isLogin = await userService.isLogin(email, password);
                if (isLogin) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                }
              }
            },
            child: Text("Login!"),
          ),
        ],
      ),
    );
  }
}
