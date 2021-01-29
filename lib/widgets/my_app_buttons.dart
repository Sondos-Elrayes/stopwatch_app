import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MyAppButtons extends StatelessWidget {
  final String buttonTitle;
  final Color buttonColor;
  final Function onPressed;
  MyAppButtons(
      {@required this.buttonTitle, this.buttonColor, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
