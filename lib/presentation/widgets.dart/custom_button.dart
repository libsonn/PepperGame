import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  CustomButton({@required this.onPressed, @required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(blueComponentsColor),
          shadowColor: MaterialStateProperty.all<Color>(Colors.black26),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: backgroundColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
