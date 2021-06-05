import 'package:pepper_game/logic/enums.dart';
import 'package:pepper_game/logic/models/transaction_model.dart';

abstract class Sale extends Transaction {
  double get totalIncome => pepperPrice * quantity;
  int get quantitySold;

  Sale({int quantity, bool isSuccessful})
      : super(
          pepperPrice: 2.0,
          quantity: quantity,
          isSuccessful: isSuccessful,
          typeOfTransaction: TypeOfTransaction.SaleTransaction,
        );
}

class SaleSuccessful extends Sale {
  SaleSuccessful({
    int quantity,
  }) : super(
          quantity: quantity,
          isSuccessful: true,
        );

  @override
  int get quantitySold => quantity;
}

class SaleUnsuccessful extends Sale {
  SaleUnsuccessful({
    int quantity,
  }) : super(
          quantity: quantity,
          isSuccessful: false,
        );

  @override
  int get quantitySold => 0;
}
