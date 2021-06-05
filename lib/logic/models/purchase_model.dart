import 'package:pepper_game/logic/enums.dart';
import 'package:pepper_game/logic/models/transaction_model.dart';

abstract class Purchase extends Transaction {
  double get totalPrice => pepperPrice * quantity;

  double get toPay;

  int get quantityBought;

  Purchase({double pepperPrice, int quantity, bool isSuccessful})
      : super(
          pepperPrice: pepperPrice,
          quantity: quantity,
          isSuccessful: isSuccessful,
          typeOfTransaction: TypeOfTransaction.PurchaseTransaction,
        );
}

class PurchaseSuccessful extends Purchase {
  PurchaseSuccessful({
    double pepperPrice,
    int quantity,
  }) : super(
          pepperPrice: pepperPrice,
          quantity: quantity,
          isSuccessful: true,
        );

  @override
  int get quantityBought => quantity;

  @override
  double get toPay => totalPrice + 0.2;
}

class PurchaseUnsuccessful extends Purchase {
  PurchaseUnsuccessful({
    double pepperPrice,
    int quantity,
  }) : super(
          pepperPrice: pepperPrice,
          quantity: quantity,
          isSuccessful: false,
        );

  @override
  int get quantityBought => 0;

  @override
  double get toPay => 0.2;
}
