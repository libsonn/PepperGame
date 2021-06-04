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
    if (merchantState is MerchantInitial) {
      return Column(
        children: [
          BuyPeppersPicker(),
          SellPeppersPicker(),
        ],
      );
    } else
      return Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Previous transaction:',
                style: TextStyle(
                    color: redTextColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              //TODO Poprawić błędy, pokazać stan kasy i papryk na starcie, nie pokazywać info o kupnie jeśli sprzedajemy
              Text(
                'Price for pepper: ${merchantState.merchant.calculationLogic.purchase.pepperPrice.toStringAsFixed(2)}\$',
                style: TextStyle(color: redTextColor, fontSize: 25.0),
              ),
              Text(
                'Total price: ${merchantState.merchant.calculationLogic.purchase.totalPrice.toStringAsFixed(2)}\$',
                style: TextStyle(color: redTextColor, fontSize: 25.0),
              ),
              Text(
                'Wanted to buy: ${merchantState.merchant.calculationLogic.purchase.quantityToBuy} peppers',
                style: TextStyle(color: redTextColor, fontSize: 25.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Your budget: ${merchantState.merchant.calculationLogic.cash.toStringAsFixed(2)}\$',
                style: TextStyle(color: redTextColor, fontSize: 25.0),
              ),
              Text(
                merchantState.merchant.calculationLogic.numberOfPeppers != 1
                    ? 'You have ${merchantState.merchant.calculationLogic.numberOfPeppers} peppers'
                    : 'You have ${merchantState.merchant.calculationLogic.numberOfPeppers} pepper',
                style: TextStyle(color: redTextColor, fontSize: 25.0),
              ),
              SizedBox(
                height: 40.0,
              ),
              BuyPeppersPicker(),
              SellPeppersPicker(),
            ],
          ),
        ],
      );
  }
}
