// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, prefer_typing_uninitialized_variables, sort_child_properties_last

import 'package:bmi/mybottom.dart';
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
              Navigator.pushNamed(context, '/first');
            },
          ),
        ],
      ),
    );
  }
}
