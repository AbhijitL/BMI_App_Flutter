import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';
class ButtomButton extends StatelessWidget {
  ButtomButton({@required this.onTap, this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: Container(
          child: Center(child: Text(buttonTitle ,style: kLargeButtonTextStyle,)),
        //margin: EdgeInsets.only(top: 2.0),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}