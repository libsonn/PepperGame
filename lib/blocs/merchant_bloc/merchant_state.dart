part of 'merchant_bloc.dart';

@immutable
abstract class MerchantState extends Equatable {
  final Merchant merchant;
  MerchantState({@required this.merchant});
}

class MerchantInitial extends MerchantState {
  final Merchant merchant;
  MerchantInitial({@required this.merchant}) : super(merchant: merchant);

  @override
  List<Object> get props => [merchant];
}

class MerchantDidAction extends MerchantState {
  final Merchant merchant;
  MerchantDidAction({@required this.merchant}) : super(merchant: merchant);

  @override
  List<Object> get props => [merchant];
}

class LostGame extends MerchantState {
  final Merchant merchant;
  LostGame({@required this.merchant}) : super(merchant: merchant);

  @override
  List<Object> get props => [merchant];
}
