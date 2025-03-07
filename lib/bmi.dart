// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, prefer_typing_uninitialized_variables, sort_child_properties_last

import 'dart:math';

import 'package:bmi/mybottom.dart';
import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'content.dart';
import 'gender.dart';

import 'mycontainer.dart';

enum Gender { male, female }

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  Gender? selectGender;
  // //!create variable

  // Color maleColor = inactivColor;
  // Color femaleColor = inactivColor;

  // //!create void male=1 female =2
  // void updatColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleColor == inactivColor) {
  //       maleColor = activeColor;
  //       femaleColor = inactivColor;
  //     } else {
  //       maleColor = inactivColor;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleColor == inactivColor) {
  //       femaleColor = activeColor;
  //       maleColor = inactivColor;
  //     } else {
  //       femaleColor = inactivColor;
  //     }
  //   }
  // }

  void navigateWithRandomAnimation(BuildContext context, Widget page) {
    final random = Random();
    final animations = [
      _slideFromLeft,
      _slideFromRight,
      _slideFromTop,
      _slideFromBottom,
      _scaleFromCenter,
      _fadeIn,
    ];

    final selectedAnimation = animations[random.nextInt(animations.length)];

    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return selectedAnimation(animation, child);
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  // انیمیشن‌های مختلف
  Widget _slideFromLeft(Animation<double> animation, Widget child) {
    var tween = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.easeInOut));
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }

  Widget _slideFromRight(Animation<double> animation, Widget child) {
    var tween = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.easeInOut));
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }

  Widget _slideFromTop(Animation<double> animation, Widget child) {
    var tween = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.easeInOut));
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }

  Widget _slideFromBottom(Animation<double> animation, Widget child) {
    var tween = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.easeInOut));
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }

  Widget _scaleFromCenter(Animation<double> animation, Widget child) {
    var scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).chain(CurveTween(curve: Curves.easeOutBack)).animate(animation);
    return ScaleTransition(scale: scaleAnimation, child: child);
  }

  Widget _fadeIn(Animation<double> animation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }

  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    child: MyContainer(
                      childCart: myGender(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                      color:
                          selectGender == Gender.male
                              ? activeColor
                              : inactiveColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    child: MyContainer(
                      childCart: myGender(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                      color:
                          selectGender == Gender.female
                              ? activeColor
                              : inactiveColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              color: activeColor,
              childCart: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelStyle),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(height.toString(), style: kNumberStyle),
                      Text('cm', style: kLabelStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayColor: Color(0x29EA1554),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8D909D),
                      thumbColor: Color(0xffEA1554),
                    ),

                    child: Slider(
                      min: 120,
                      max: 200,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    color: activeColor,
                    childCart: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLabelStyle),
                        SizedBox(height: 15),
                        Text(weight.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: MaterialButton(
                                height: 50,
                                elevation: 8,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.minus),
                                color: Color(0xff1B2033),
                                shape: CircleBorder(),
                              ),
                            ),
                            SizedBox(width: 13),
                            Expanded(
                              child: MaterialButton(
                                height: 50,
                                elevation: 8,
                                child: Icon(FontAwesomeIcons.plus),
                                shape: CircleBorder(),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                color: Color(0xff1B2033),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    color: activeColor,
                    childCart: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelStyle),
                        SizedBox(height: 15),
                        Text(age.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: MaterialButton(
                                height: 50,
                                elevation: 8,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.minus),
                                color: Color(0xff1B2033),
                                shape: CircleBorder(),
                              ),
                            ),
                            SizedBox(width: 13),
                            Expanded(
                              child: MaterialButton(
                                height: 50,
                                elevation: 8,
                                child: Icon(FontAwesomeIcons.plus),
                                shape: CircleBorder(),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                color: Color(0xff1B2033),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          MyBottom(
            text: 'CALCULATE',
            onTap: () {
              navigateWithRandomAnimation(context, ResultScreen());
            },
          ),
        ],
      ),
    );
  }
}
