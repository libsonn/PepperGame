import 'package:flutter/material.dart';

abstract class Purchase {
  final double pepperPrice;
  final int quantityToBuy;
  double totalPrice;
  double toPay;
  bool isSuccessful;
  int quantityBought;

  Purchase({
    @required this.pepperPrice,
    @required this.quantityToBuy,
  }) {
    totalPrice = pepperPrice * quantityToBuy + 0.2;
  }
}

class PurchaseSuccesful extends Purchase {
  final double pepperPrice;
  final int quantity;

  PurchaseSuccesful({
    @required this.pepperPrice,
    @required this.quantity,
  }) : super(
          pepperPrice: pepperPrice,
          quantityToBuy: quantity,
        ) {
    isSuccessful = true;
    toPay = totalPrice;
    quantityBought = quantity;
  }
}

class PurchaseUnsuccesful extends Purchase {
  final double pepperPrice;
  final int quantity;

  PurchaseUnsuccesful({
    @required this.pepperPrice,
    @required this.quantity,
  }) : super(
          pepperPrice: pepperPrice,
          quantityToBuy: quantity,
        ) {
    isSuccessful = false;
    toPay = 0.2;
    quantityBought = 0;
  }
}
