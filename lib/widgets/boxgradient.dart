import 'package:flutter/material.dart';

class CustomBoxGradient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomBoxGradientState();
}

class CustomBoxGradientState extends State<CustomBoxGradient> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff519CFE), Color(0xff8DA1FE), Color(0xffC291FE)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.7, 0.8, 1.0],
      )),
    );
  }
}
