import 'package:acquaintance/services/FirebaseProvider.dart';
import 'package:acquaintance/widgets/boxgradient.dart';
import 'package:acquaintance/widgets/user/signupform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  final authController = TextEditingController();
  final double padding = 15;
  FirebaseProvider fp;
  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);
    final avdHeight = MediaQuery.of(context).size.height;
    final avdWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  CustomBoxGradient(),
                ],
              ),
            ),
            Positioned(
              width: avdWidth,
              height: avdHeight * 0.7,
              top: 80,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Card(
                  elevation: 5,
                  child: Form(
                    key: _formkey,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          joinText(),
                          joinRow("성함", "홍길동", nameController, avdWidth),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
                          ),
                          joinRow("이메일", "email@email.com", emailController,
                              avdWidth),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
                          ),
                          joinRow("비밀번호", "●●●●", passController, avdWidth),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
                          ),
                          joinButtonRow("연락처", "010-0000-0000", phoneController,
                              avdWidth),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
                          ),
                          joinButtonRow("인증번호", "", authController, avdWidth),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
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
              top: avdHeight / 1.3,
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
                    onTap: () {
                      print(authController.text);
                      print(emailController.text);
                      print(nameController.text);
                      print(passController.text);
                      print(phoneController.text);
                      if (_formkey.currentState.validate()) {
                        print("fffff");
                        fp.signUpWithEmail(
                            emailController.text, passController.text);
                      } else {
                        fp.signUpWithEmail(
                            emailController.text, passController.text);
                      }
                    },
                    child: Center(
                      child: Text(
                        "가입완료",
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
              top: avdHeight / 1.1,
              child: Text(
                "By clicking join, you agree blah blah",
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  joinText() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "회원가입",
            style: TextStyle(
                color: Color(0xff519CFE), fontFamily: "Youth", fontSize: 23),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          ),
          Text(
            "아래 정보를 입력해주세요.",
            style: TextStyle(
                color: Color(0xff519CFE), fontFamily: "Youth", fontSize: 15),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          ),
        ],
      ),
    );
  }

  joinRow(String title, String hintText,
      TextEditingController textEditingController, double avdWidth) {
    bool isPassword = false;
    if (title == "비밀번호") {
      isPassword = true;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey[400]),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: avdWidth / 4,
            child: Text(
              title,
              style: TextStyle(fontFamily: "Youth", fontSize: 20),
            ),
          ),
          Container(
            width: avdWidth / 2,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              controller: textEditingController,
              onChanged: (value) {},
              validator: (value) {
                if (value.isEmpty) {
                  return title + "을 입력해주세요.";
                }
                return null;
              },
              obscureText: isPassword,
            ),
          ),
        ],
      ),
    );
  }

  joinButtonRow(String title, String hintText,
      TextEditingController textEditingController, double avdWidth) {
    String buttonName = "요청";
    if (title == "인증번호") buttonName = "확인";
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey[400]),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: avdWidth / 4,
            child: Text(
              title,
              style: TextStyle(fontFamily: "Youth", fontSize: 20),
            ),
          ),
          Container(
            width: avdWidth / 5,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              controller: textEditingController,
              onChanged: (value) {},
              validator: (value) {
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          ),
          Container(
            width: avdWidth / 4,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white,
                onTap: () {
                  print("인증번호 요청!");
                },
                child: Center(
                  child: Text(
                    "인증번호 " + buttonName,
                    style: TextStyle(
                      fontFamily: "Youth",
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
