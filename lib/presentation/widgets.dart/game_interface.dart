import 'package:flutter/material.dart';
import 'package:pepper_game/blocs/merchant_bloc/merchant_bloc.dart';
import 'package:pepper_game/colors.dart';
import 'package:pepper_game/presentation/widgets.dart/buy_peppers_picker.dart';
import 'package:pepper_game/presentation/widgets.dart/sell_peppers_picker.dart';

class GameInterface extends StatelessWidget {
  final MerchantState merchantState;
  GameInterface({@required this.merchantState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              'Your budget: ${merchantState.merchant.cash.toStringAsFixed(2)}\$',
              style: TextStyle(color: redTextColor, fontSize: 25.0),
            ),
            Text(
              'Price for peppers: ${merchantState.merchant.previousTotalPrice.toStringAsFixed(2)}\$',
              style: TextStyle(color: redTextColor, fontSize: 25.0),
            ),
            Text(
              merchantState.merchant.numberOfPeppers != 1
                  ? 'You have ${merchantState.merchant.numberOfPeppers} peppers'
                  : 'You have ${merchantState.merchant.numberOfPeppers} pepper',
              style: TextStyle(color: redTextColor, fontSize: 25.0),
            ),
          ],
        ),
        SizedBox(
          height: 40.0,
        ),
        BuyPeppersPicker(),
        SellPeppersPicker(),
      ],
    );
  }
}
