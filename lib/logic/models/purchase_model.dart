abstract class Purchase {
  final double pepperPrice;
  final bool isSuccessful;
  final int quantityToBuy;

  double get totalPrice => pepperPrice * quantityToBuy;

  double get toPay;

  int get quantityBought;

  Purchase(
    this.isSuccessful,
    this.pepperPrice,
    this.quantityToBuy,
  );
}

class PurchaseSuccessful extends Purchase {
  PurchaseSuccessful({
    double pepperPrice,
    int quantityToBuy,
  }) : super(
          true,
          pepperPrice,
          quantityToBuy,
        );

  @override
  int get quantityBought => quantityToBuy;

  @override
  double get toPay => totalPrice + 0.2;
}

class PurchaseUnsuccessful extends Purchase {
  PurchaseUnsuccessful({
    double pepperPrice,
    int quantityToBuy,
  }) : super(
          false,
          pepperPrice,
          quantityToBuy,
        );

  @override
  int get quantityBought => 0;

  @override
  double get toPay => 0.2;
}
