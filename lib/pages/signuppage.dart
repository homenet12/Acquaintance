import 'package:acquaintance/services/FirebaseProvider.dart';
import 'package:acquaintance/widgets/boxgradient.dart';
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
    final avdHeight = MediaQuery.of(context).size.height;
    final avdWidth = MediaQuery.of(context).size.width;
    fp = Provider.of<FirebaseProvider>(context);
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
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.grey[400]),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: avdWidth / 4,
                                  child: Text(
                                    "연락처",
                                    style: TextStyle(
                                        fontFamily: "Youth", fontSize: 20),
                                  ),
                                ),
                                Container(
                                  width: avdWidth / 5,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "+82 10-0000-",
                                      border: InputBorder.none,
                                    ),
                                    controller: phoneController,
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
                                      onTap: () async {
                                        print("인증번호 요청!");
                                        fp.fAuth.verifyPhoneNumber(
                                          phoneNumber: phoneController.text,
                                          verificationCompleted:
                                              (PhoneAuthCredential pac) {
                                            print(pac.smsCode);
                                            print(pac.token);
                                            print(pac.verificationId);
                                            print(pac.providerId);
                                            print(pac.signInMethod);
                                          },
                                          verificationFailed:
                                              (FirebaseException fe) {
                                            print(fe.message);
                                          },
                                          codeSent: (String s, int i) {
                                            print("codeSent");
                                            print(s);
                                            print(i);
                                          },
                                          codeAutoRetrievalTimeout: (String s) {
                                            print("codeAuto");
                                            print(s);
                                          },
                                        );
                                      },
                                      child: Center(
                                        child: Text(
                                          "인증번호 요청",
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
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.grey[400]),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: avdWidth / 4,
                                  child: Text(
                                    "인증번호",
                                    style: TextStyle(
                                        fontFamily: "Youth", fontSize: 20),
                                  ),
                                ),
                                Container(
                                  width: avdWidth / 5,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "",
                                      border: InputBorder.none,
                                    ),
                                    controller: authController,
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
                                      onTap: () async {
                                        print("인증번호 확인!");
                                        //PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode)
                                      },
                                      child: Center(
                                        child: Text(
                                          "인증번호 확인",
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
                          ),
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
                        //fp.signUpWithEmail(
                        //    emailController.text, passController.text);
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
              textInputAction: TextInputAction.next,
              obscureText: isPassword,
            ),
          ),
        ],
      ),
    );
  }

  joinButtonRow(String title, String hintText,
      TextEditingController textEditingController, double avdWidth) {
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
                onTap: () async {
                  print("인증번호 요청!");
                  print(textEditingController.text);
                },
                child: Center(
                  child: Text(
                    "인증번호 확인",
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

  test() {
    fp.fAuth.verifyPhoneNumber(
      phoneNumber: "textEditingController.text",
      verificationCompleted: (PhoneAuthCredential pac) {
        print(pac.smsCode);
        print(pac.token);
        print(pac.verificationId);
        print(pac.providerId);
        print(pac.signInMethod);
      },
      verificationFailed: (FirebaseException fe) {
        print(fe.message);
      },
      codeSent: (String s, int i) {
        print("codeSent");
        print(s);
        print(i);
      },
      codeAutoRetrievalTimeout: (String s) {
        print("codeAuto");
        print(s);
      },
    );
  }
}
