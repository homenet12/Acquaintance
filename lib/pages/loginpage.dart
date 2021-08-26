import 'package:acquaintance/pages/helppage.dart';
import 'package:acquaintance/pages/signuppage.dart';
import 'package:acquaintance/services/FirebaseProvider.dart';
import 'package:acquaintance/services/user/userservice.dart';
import 'package:acquaintance/widgets/user/loginform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FirebaseProvider fp;
  UserService us;

  @override
  Widget build(BuildContext context) {
    final avdHeight = MediaQuery.of(context).size.height;
    final avdWidth = MediaQuery.of(context).size.width;
    fp = Provider.of<FirebaseProvider>(context);
    us = UserService();

    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: avdHeight,
              child: Column(
                children: [
                  Container(
                    height: avdHeight / 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff519CFE),
                          Color(0xff8DA1FE),
                          Color(0xffC291FE)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.7, 0.8, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              width: 300,
              height: 300,
              top: avdHeight / 20,
              child: Container(
                child: Image.asset("images/bbam.PNG"),
              ),
            ),
            Positioned(
              width: avdWidth,
              height: avdHeight / 3,
              top: avdHeight / 2.5,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Card(
                  elevation: 5,
                  child: Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.grey[400]),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("이메일",
                                    style: TextStyle(
                                        fontFamily: "Youth", fontSize: 20)),
                                Container(
                                  width: avdWidth / 2.1,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "email@email.com",
                                      border: InputBorder.none,
                                    ),
                                    controller: emailController,
                                    onChanged: (email) {},
                                    validator: (email) {
                                      if (email.isEmpty) {
                                        return '이메일을 입력해주세요.';
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    focusNode: emailFocus,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.grey[400]),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("비밀번호",
                                    style: TextStyle(
                                        fontFamily: "Youth", fontSize: 20)),
                                Container(
                                  width: avdWidth / 2.1,
                                  child: TextFormField(
                                    controller: passController,
                                    obscureText: true,
                                    onChanged: (password) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              width: 200.0,
              height: 50.0,
              top: avdHeight / 1.43,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff519CFE),
                      Color(0xff8DA1FE),
                      Color(0xffC291FE)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.2, 0.5, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () async {
                      print("Login!!");
                      String email = emailController.text;
                      String pass = passController.text;
                      bool isEmail = us.emailValidation(email);

                      if (!isEmail) {
                        callSnackBar("이메일 형식이 맞지 않습니다.", context, emailFocus);
                        return;
                      }

                      bool isLogin = await fp.signInWithEmail(email, pass);
                      if (isLogin) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HelpPage(),
                          ),
                        );
                      } else {
                        print("login 실패");
                        callSnackBar(
                            "아이디 혹은 비밀번호가 맞지않습니다.", context, emailFocus);
                      }
                    },
                    child: Center(
                      child: Text(
                        "로그인",
                        style: TextStyle(
                          fontFamily: "Youth",
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              width: 200,
              height: 200,
              top: avdHeight / 1.2,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      print("sign up!");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      "your don't have ID?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    "find password",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

callSnackBar(String text, BuildContext context, FocusNode focus) {
  final snackBar = SnackBar(
    content: Text(text),
    action: SnackBarAction(
      label: '확인',
      onPressed: () {
        focus.requestFocus();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
