import 'package:flutter/material.dart';
import 'package:pepper_game/blocs/merchant_bloc/merchant_bloc.dart';
import 'package:pepper_game/colors.dart';

import '../buy_peppers_picker.dart';
import '../sell_peppers_picker.dart';

class InitialInterface extends StatelessWidget {
  InitialInterface({
    @required this.merchantState,
  });

  final MerchantState merchantState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your budget: ${merchantState.merchant.budget} \$',
          style: TextStyle(color: redTextColor, fontSize: 25.0),
        ),
        Text(
          'You have ${merchantState.merchant.numberOfPeppers} peppers',
          style: TextStyle(color: redTextColor, fontSize: 25.0),
        ),
        BuyPeppersPicker(),
        SellPeppersPicker(),
      ],
    );
  }
}
