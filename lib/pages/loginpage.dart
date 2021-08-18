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
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
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
            Positioned(
              width: 300,
              height: 300,
              child: Container(
                child: Image.asset("images/bbam.PNG"),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Card(
                  elevation: 5,
                  child: LoginForm(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              bottom: (MediaQuery.of(context).size.height / 4) * -1,
            ),
            Positioned(
              width: 200.0,
              height: 50.0,
              bottom: (MediaQuery.of(context).size.height / 3.6) * -1,
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
                    onTap: () {},
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
              bottom: (MediaQuery.of(context).size.height / 1.6) * -1,
              child: Column(
                children: [
                  Text(
                    "your don't have ID?",
                    style: TextStyle(color: Colors.grey),
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
