import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pepper_game/blocs/merchant_bloc/merchant_bloc.dart';
import 'package:pepper_game/presentation/widgets.dart/custom_button.dart';
import 'package:pepper_game/presentation/widgets.dart/game_interface.dart';
import 'package:pepper_game/presentation/widgets.dart/lost_game_message.dart';

import '../../colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/pepper.png',
              scale: 4.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            BlocBuilder<MerchantBloc, MerchantState>(
              builder: (context, merchantState) {
                if (merchantState is LostGame) {
                  return LostGameMessage();
                } else
                  return GameInterface(
                    merchantState: merchantState,
                  );
              },
            ),
            SizedBox(
              height: 40.0,
            ),
            CustomButton(
              onPressed: () {
                BlocProvider.of<MerchantBloc>(context).add(Reset());
              },
              text: 'Reset Game',
            ),
          ],
        ),
      ),
    );
  }
}
