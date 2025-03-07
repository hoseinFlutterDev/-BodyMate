import 'package:flutter/material.dart';
import 'content.dart';

class myGender extends StatelessWidget {
  myGender({Key? key, this.icon, this.text}) : super(key: key);
  final icon;
  final text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80, color: Color(0xff8D909D)),
        SizedBox(height: 10),
        Text(text, style: kLabelStyle),
      ],
    );
  }
}
