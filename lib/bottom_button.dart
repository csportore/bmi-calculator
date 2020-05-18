import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
//  const BottomButton({
//    Key key,
//  }) : super(key: key);

  BottomButton({@required this.buttonLabel, @required this.onTap});

  final Function onTap;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: FlatButton(
        color: kBottomContainerColor,
        textColor: Colors.white,
        child: Text(
          buttonLabel,
          style: kLargeButtonTextStyle,
        ),
        onPressed: onTap,
      ),
      height: kBottomContainerHeight,
    );
  }
}
