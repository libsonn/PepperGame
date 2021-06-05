import 'package:flutter_test/flutter_test.dart';
import 'package:pepper_game/logic/calculation_logic.dart';
import 'package:pepper_game/logic/models/purchase_model.dart';
import 'package:pepper_game/logic/pepper_price_generator.dart';

void main() {
  group('Calc test', () {
    test('Too many peppers', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.5);
      CalculationLogic calculationLogic =
          CalculationLogic(generator: pepperPriceGenerator);
      Purchase purchase = calculationLogic.buyPeppers(quantity: 5);

      expect(purchase.isSuccessful, false);
    });

    test('Right amount of peppers', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.5);
      CalculationLogic calculationLogic =
          CalculationLogic(generator: pepperPriceGenerator);
      Purchase purchase = calculationLogic.buyPeppers(quantity: 4);

      expect(purchase.isSuccessful, false);
    });

    test('Right amount of peppers - edge case', () {
      PepperPriceGenerator pepperPriceGenerator =
          MockPepperPriceGenerator(2.45);
      CalculationLogic calculationLogic =
          CalculationLogic(generator: pepperPriceGenerator);
      Purchase purchase = calculationLogic.buyPeppers(quantity: 4);

      expect(purchase.isSuccessful, true);
    });

    test('Bad amount of peppers - edge case', () {
      PepperPriceGenerator pepperPriceGenerator =
          MockPepperPriceGenerator(2.4500001);
      CalculationLogic calculationLogic =
          CalculationLogic(generator: pepperPriceGenerator);
      Purchase purchase = calculationLogic.buyPeppers(quantity: 4);

      expect(purchase.isSuccessful, false);
    });

    test('Cant continue playing', () {
      PepperPriceGenerator pepperPriceGenerator =
          MockPepperPriceGenerator(2.4500001);
      CalculationLogic calculationLogic =
          CalculationLogic(generator: pepperPriceGenerator, cash: 0.5);
      bool canStillPlay = calculationLogic.canStillPlay;
      expect(canStillPlay, false);
    });

    test('Can continue playing', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.5);
      CalculationLogic calculationLogic =
          CalculationLogic(generator: pepperPriceGenerator);
      bool canStillPlay = calculationLogic.canStillPlay;
      expect(canStillPlay, true);
    });

    test('Can continue playing', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.5);
      CalculationLogic calculationLogic =
          CalculationLogic(generator: pepperPriceGenerator, cash: 2.7);
      calculationLogic.buyPeppers(quantity: 1);
      bool canStillPlay = calculationLogic.canStillPlay;
      expect(canStillPlay, true);
    });

    test('Cant continue playing - sequence of transactions (fixed price)', () {
      PepperPriceGenerator pepperPriceGenerator = MockPepperPriceGenerator(2.5);
      CalculationLogic calculationLogic =
          CalculationLogic(generator: pepperPriceGenerator, cash: 2.7);
      calculationLogic.buyPeppers(quantity: 1);
      calculationLogic.sellPeppers(quantity: 1);
      calculationLogic.buyPeppers(quantity: 1);
      calculationLogic.buyPeppers(quantity: 1);
      calculationLogic.buyPeppers(quantity: 1);
      bool canStillPlay = calculationLogic.canStillPlay;
      expect(canStillPlay, false);
    });

    test('Cant continue playing - sequence of transactions (array of prices)',
        () {
      PepperPriceGenerator pepperPriceGenerator =
          MockArrayPepperPriceGenerator([2.5, 1.8, 2.5, 2.5, 2.5]);
      CalculationLogic calculationLogic =
          CalculationLogic(generator: pepperPriceGenerator, cash: 2.7);
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
}
