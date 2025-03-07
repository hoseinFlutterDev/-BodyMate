import 'package:bmi/content.dart';
import 'package:bmi/mybottom.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATE'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('Your Result', style: kTitreStyle),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: inactiveColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: Text('data', style: kResultStyle)),
                    Center(child: Text('135', style: kNumberStyle)),
                    Center(child: Text('data')),
                  ],
                ),
              ),
            ),
          ),
          MyBottom(text: '', onTap: () {}),
        ],
      ),
    );
  }
}
