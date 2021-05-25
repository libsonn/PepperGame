part of 'merchant_bloc.dart';

abstract class MerchantEvent extends Equatable {
  const MerchantEvent();

  @override
  List<Object> get props => [];
}

class BuyPeppers extends MerchantEvent {
  final int quantity;
  BuyPeppers({@required this.quantity});
}

class SellPeppers extends MerchantEvent {
  final int quantity;

  SellPeppers({@required this.quantity});
}

class Reset extends MerchantEvent {
  Reset();
}
