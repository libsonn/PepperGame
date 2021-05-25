import 'package:flutter/material.dart';
import 'package:pepper_game/colors.dart';

class LostGameMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'You lost!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: redTextColor,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
