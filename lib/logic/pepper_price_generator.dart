import 'dart:math';

abstract class PepperPriceGenerator {
  double generatePrice();
}

class RandomPepperPriceGenerator extends PepperPriceGenerator {
  @override
  double generatePrice() {
    double min = 1.5;
    double max = 2.5;
    return Random().nextDouble() * (max - min) + min;
  }
}

class MockPepperPriceGenerator extends PepperPriceGenerator {

  MockPepperPriceGenerator(this.price);

  final double price;

  @override
  double generatePrice() => price;
}

class MockArrayPepperPriceGenerator extends PepperPriceGenerator {

  MockArrayPepperPriceGenerator(this.price);

  final List<double> price;

  @override
  double generatePrice() {
    double pepperPrice = price.first;
    price.removeAt(0);
    return pepperPrice;
  }
}