import 'dart:math';

import 'package:flutter/material.dart';

class CalculationLogic {
  double getRandomPepperPrice() {
    double min = 1.5;
    double max = 2.5;
    return Random().nextDouble() * (max - min) + min;
  }

  double calculatePeppersValue(
      {@required double priceForOnePepper, @required int quantity}) {
    return priceForOnePepper * quantity + 0.2;
  }

  bool canBuyPeppers({@required double price, @required double budget}) {
    return budget >= price;
  }

  bool canSellPeppers(
      {@required int quantityToSell, @required int havePeppers}) {
    return havePeppers >= quantityToSell;
  }
}
