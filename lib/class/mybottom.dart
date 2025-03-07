// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'content.dart';

class MyBottom extends StatelessWidget {
  final String text;
  void Function()? onTap;
  MyBottom({Key? key, required this.text, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: heightContainer,
        color: bottomContainer,
        child: Text(text, style: kBottomStyle),
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 10),
      ),
    );
  }
}
