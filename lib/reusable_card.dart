import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
//  const ReusableCard({
//    Key key,
//  }) : super(key: key);
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Widget cardChild;
  final Color colour;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: this.cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
