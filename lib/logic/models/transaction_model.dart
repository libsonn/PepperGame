import 'package:pepper_game/logic/enums.dart';

abstract class Transaction {
  final double pepperPrice;
  final int quantity;
  final bool isSuccessful;
  final TypeOfTransaction typeOfTransaction;

  Transaction({
    this.pepperPrice,
    this.quantity,
    this.isSuccessful,
    this.typeOfTransaction,
  });
}
