import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;

  SignUpForm(this.formkey);
  @override
  State<StatefulWidget> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  final authController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double padding = 15;
    final avdHeight = MediaQuery.of(context).size.height;
    final avdWidth = MediaQuery.of(context).size.width;

    return Form(
      key: widget.formkey,
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
            joinRow("이메일", "email@email.com", emailController, avdWidth),
            Padding(
              padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
            ),
            joinRow("비밀번호", "●●●●", passController, avdWidth),
            Padding(
              padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
            ),
            joinButtonRow("연락처", "010-0000-0000", phoneController, avdWidth),
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
    if (title == "패스워드") {
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
