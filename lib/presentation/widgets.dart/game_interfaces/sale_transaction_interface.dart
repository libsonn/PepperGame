import 'package:flutter/material.dart';
import 'package:pepper_game/blocs/merchant_bloc/merchant_bloc.dart';
import 'package:pepper_game/colors.dart';
import 'package:pepper_game/logic/models/sale_model.dart';
import 'package:pepper_game/presentation/widgets.dart/buy_peppers_picker.dart';
import 'package:pepper_game/presentation/widgets.dart/sell_peppers_picker.dart';

class SaleTransactionInterface extends StatelessWidget {
  final MerchantState merchantState;
  SaleTransactionInterface({@required this.merchantState});
  @override
  Widget build(BuildContext context) {
    Sale sale = merchantState.transaction;
    if (sale.isSuccessful) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sale transaction:',
            style: TextStyle(
                color: redTextColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Price for pepper: ${sale.pepperPrice.toStringAsFixed(2)}\$',
            style: TextStyle(color: redTextColor, fontSize: 25.0),
          ),
          Text(
            'Total income: ${sale.totalIncome.toStringAsFixed(2)}\$',
            style: TextStyle(color: redTextColor, fontSize: 25.0),
          ),
          Text(
            'Wanted to sell: ${sale.quantity} peppers',
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
    } else if (!sale.isSuccessful) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sale transaction:',
            style: TextStyle(
                color: redTextColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'You don\'t have any peppers!',
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
    return Container();
  }
}
