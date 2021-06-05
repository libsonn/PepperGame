import 'package:flutter/material.dart';
import 'package:pepper_game/blocs/merchant_bloc/merchant_bloc.dart';
import 'package:pepper_game/colors.dart';
import 'package:pepper_game/logic/models/purchase_model.dart';
import 'package:pepper_game/presentation/widgets.dart/buy_peppers_picker.dart';
import 'package:pepper_game/presentation/widgets.dart/sell_peppers_picker.dart';

class PurchaseTransactionInterface extends StatelessWidget {
  const PurchaseTransactionInterface({
    @required this.merchantState,
  });

  final MerchantState merchantState;

  @override
  Widget build(BuildContext context) {
    Purchase purchase = merchantState.transaction;
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Buy transaction:',
          style: TextStyle(
              color: redTextColor, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        Text(
          'Price for pepper: ${purchase.pepperPrice.toStringAsFixed(2)}\$',
          style: TextStyle(color: redTextColor, fontSize: 25.0),
        ),
        Text(
          'Total price: ${purchase.totalPrice.toStringAsFixed(2)}\$',
          style: TextStyle(color: redTextColor, fontSize: 25.0),
        ),
        Text(
          'Wanted to buy: ${purchase.quantity} peppers',
          style: TextStyle(color: redTextColor, fontSize: 25.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Your budget: ${merchantState.merchant.budget.toStringAsFixed(2)} \$',
          style: TextStyle(color: redTextColor, fontSize: 25.0),
        ),
        Text(
          'You have ${merchantState.merchant.numberOfPeppers} peppers',
          style: TextStyle(color: redTextColor, fontSize: 25.0),
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
