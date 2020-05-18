import 'package:bmi_calculator/result_page_vo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/enum_gender.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/bottom_button.dart';

import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  EnumGender genderSelected;
  int height = 180;
  int weight = 70;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        genderSelected = EnumGender.MALE;
                      });
                    },
                    colour: genderSelected == EnumGender.MALE
                        ? kActiveColourCard
                        : kInactiveColourCard,
                    cardChild: IconContent(
                      label: 'MALE',
                      cardIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        genderSelected = EnumGender.FEMALE;
                      });
                    },
                    colour: genderSelected == EnumGender.FEMALE
                        ? kActiveColourCard
                        : kInactiveColourCard,
                    cardChild: IconContent(
                      label: 'FEMALE',
                      cardIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kValueTextStyle,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              thumbColor: kBottomContainerColor,
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15.0,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 30.0,
                              ),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 250.0,
                              onChanged: (n) {
                                setState(() {
                                  height = n.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      colour: kActiveColourCard),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(weight.toString(), style: kValueTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    this.weight += 1;
                                  });
                                },
                                child: FontAwesomeIcons.plus,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    this.weight -= 1;
                                  });
                                },
                                child: FontAwesomeIcons.minus,
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kActiveColourCard),
                ),
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(age.toString(), style: kValueTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    this.age += 1;
                                  });
                                },
                                child: FontAwesomeIcons.plus,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    this.age -= 1;
                                  });
                                },
                                child: FontAwesomeIcons.minus,
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kActiveColourCard),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonLabel: 'CALCULATE',
            onTap: () {
              CalculatorBrain cb =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.pushNamed(
                context,
                '/results',
                arguments: ResultPageVO(
                  bmiResult: cb.calculateBMI(),
                  resultText: cb.getResult(),
                  interpretation: cb.getInterpretation(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.child, this.onPressed});

  final IconData child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        child,
      ),
      shape: CircleBorder(),
      onPressed: onPressed,
      elevation: 6.0,
      //disabledElevation: 1.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
