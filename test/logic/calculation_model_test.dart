import 'package:flutter_test/flutter_test.dart';
import 'package:pepper_game/logic/calculation_logic.dart';
import 'package:pepper_game/logic/models/purchase_model.dart';
import 'package:pepper_game/logic/pepper_price_generator.dart';

void main() {

  group('Calc test', () {
    test('To many peppers', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.5);
      CalculationLogic calculationLogic = CalculationLogic(generator: pepperPriceGenerator);
      Purchase purchase = calculationLogic.buyPeppers(quantity: 5);

      expect(purchase.isSuccessful, false);
    });

    test('Right amount of peppers', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.5);
      CalculationLogic calculationLogic = CalculationLogic(generator: pepperPriceGenerator);
      Purchase purchase = calculationLogic.buyPeppers(quantity: 4);

      expect(purchase.isSuccessful, false);
    });

    test('Right amount of peppers - edge case', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.45);
      CalculationLogic calculationLogic = CalculationLogic(generator: pepperPriceGenerator);
      Purchase purchase = calculationLogic.buyPeppers(quantity: 4);

      expect(purchase.isSuccessful, true);
    });

    test('Bad amount of peppers - edge case', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.4500001);
      CalculationLogic calculationLogic = CalculationLogic(generator: pepperPriceGenerator);
      Purchase purchase = calculationLogic.buyPeppers(quantity: 4);

      expect(purchase.isSuccessful, false);
    });

    //TODO change name of test
    test('Bad amount of peppers - edge case', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.4500001);
      CalculationLogic calculationLogic = CalculationLogic(generator: pepperPriceGenerator, cash: 0.5);
      bool canStillPlay = calculationLogic.canStillPlay;
      expect(canStillPlay, false);
    });

    //TODO change name of test
    test('Bad amount of peppers - edge case', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.5);
      CalculationLogic calculationLogic = CalculationLogic(generator: pepperPriceGenerator);
      bool canStillPlay = calculationLogic.canStillPlay;
      expect(canStillPlay, true);
    });

    //TODO change name of test
    test('Bad amount of peppers - edge case', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.5);
      CalculationLogic calculationLogic = CalculationLogic(generator: pepperPriceGenerator, cash: 2.7);
      calculationLogic.buyPeppers(quantity: 1);
      bool canStillPlay = calculationLogic.canStillPlay;
      expect(canStillPlay, true);
    });

    //TODO change name of test
    test('Bad amount of peppers - edge case', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.5);
      CalculationLogic calculationLogic = CalculationLogic(generator: pepperPriceGenerator, cash: 2.7);
      calculationLogic.buyPeppers(quantity: 1);
      calculationLogic.sellPeppers(quantity: 1);
      calculationLogic.buyPeppers(quantity: 1);
      calculationLogic.buyPeppers(quantity: 1);
      calculationLogic.buyPeppers(quantity: 1);
      bool canStillPlay = calculationLogic.canStillPlay;
      expect(canStillPlay, false);
    });

    //TODO change name of test
    test('Bad amount of peppers - edge case', () {
      PepperPriceGenerator pepperPriceGenerator = MockArrayPepperPriceGenerator([2.5, 1.8, 2.5, 2.5, 2.5]);
      CalculationLogic calculationLogic = CalculationLogic(generator: pepperPriceGenerator, cash: 2.7);
      calculationLogic.buyPeppers(quantity: 1);
      calculationLogic.sellPeppers(quantity: 1);
      calculationLogic.buyPeppers(quantity: 1);
      calculationLogic.buyPeppers(quantity: 1);
      calculationLogic.buyPeppers(quantity: 1);
      calculationLogic.buyPeppers(quantity: 1);
      bool canStillPlay = calculationLogic.canStillPlay;
      expect(canStillPlay, false);
    });
  });
  //
  // group('Check if random number is in range', () {
  //   test('Check 1000 random numbers', () {
  //     int _numberOfInvalidRandomNumbers = 0;
  //     CalculationLogic _calculationLogic = new CalculationLogic();
  //
  //     for (int i = 0; i < 1000; i++) {
  //       double _randomValue = _calculationLogic.getRandomPepperPrice();
  //       if (_randomValue > 2.5 || _randomValue < 1.5) {
  //         _numberOfInvalidRandomNumbers++;
  //       }
  //     }
  //
  //     expect(_numberOfInvalidRandomNumbers, 0);
  //   });
  // });
  //
  // group('Calculate total value of peppers (with 0.2\$ fee)', () {
  //   test('One pepper: 1.5 \$, quantity: 2, fee: 0.2\$', () {
  //     CalculationLogic _calculationLogic = new CalculationLogic();
  //     expect(
  //         _calculationLogic
  //             .calculatePeppersValue(priceForOnePepper: 1.5, quantity: 2)
  //             .toStringAsFixed(2),
  //         '3.20');
  //   });
  //   test('One pepper: 1.99 \$, quantity: 22, fee: 0.2\$', () {
  //     CalculationLogic _calculationLogic = new CalculationLogic();
  //     expect(
  //         _calculationLogic
  //             .calculatePeppersValue(priceForOnePepper: 1.99, quantity: 22)
  //             .toStringAsFixed(2),
  //         '43.98');
  //   });
  //   test('One pepper: 1.57 \$, quantity: 20000000, fee: 0.2\$', () {
  //     CalculationLogic _calculationLogic = new CalculationLogic();
  //     expect(
  //         _calculationLogic
  //             .calculatePeppersValue(
  //                 priceForOnePepper: 1.57, quantity: 20000000)
  //             .toStringAsFixed(2),
  //         '31400000.20');
  //   });
  //   test('One pepper: 2.5 \$, quantity: 78, fee: 0.2\$', () {
  //     CalculationLogic _calculationLogic = new CalculationLogic();
  //     expect(
  //         _calculationLogic
  //             .calculatePeppersValue(priceForOnePepper: 2.5, quantity: 78)
  //             .toStringAsFixed(2),
  //         '195.20');
  //   });
  // });
  //
  // group('Check if user would be able to buy peppers', () {
  //   CalculationLogic _calculationLogic = new CalculationLogic();
  //
  //   test('Budget > price', () {
  //     expect(_calculationLogic.canBuyPeppers(price: 2.22, budget: 55.2), true);
  //   });
  //   test('Budget > price', () {
  //     expect(_calculationLogic.canBuyPeppers(price: 2.22, budget: 2.23), true);
  //   });
  //   test('Budget = price', () {
  //     expect(_calculationLogic.canBuyPeppers(price: 2.22, budget: 2.22), true);
  //   });
  //   test('Budget < price', () {
  //     expect(_calculationLogic.canBuyPeppers(price: 2.22, budget: 2.21), false);
  //   });
  //   test('Budget < price', () {
  //     expect(_calculationLogic.canBuyPeppers(price: 2.22, budget: 1.4), false);
  //   });
  // });
  //
  // group('Check if user would be able to sell peppers', () {
  //   CalculationLogic _calculationLogic = new CalculationLogic();
  //
  //   test('Quantity to sell < have', () {
  //     expect(
  //         _calculationLogic.canSellPeppers(quantityToSell: 22, havePeppers: 55),
  //         true);
  //   });
  //   test('Quantity to sell < have', () {
  //     expect(
  //         _calculationLogic.canSellPeppers(quantityToSell: 22, havePeppers: 23),
  //         true);
  //   });
  //   test('Quantity to sell = have', () {
  //     expect(
  //         _calculationLogic.canSellPeppers(quantityToSell: 22, havePeppers: 22),
  //         true);
  //   });
  //   test('Quantity to sell > have', () {
  //     expect(
  //         _calculationLogic.canSellPeppers(quantityToSell: 22, havePeppers: 21),
  //         false);
  //   });
  //   test('Quantity to sell > have', () {
  //     expect(
  //         _calculationLogic.canSellPeppers(quantityToSell: 22, havePeppers: 10),
  //         false);
  //   });
  // });
}
