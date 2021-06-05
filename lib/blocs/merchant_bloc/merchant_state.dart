part of 'merchant_bloc.dart';

@immutable
abstract class MerchantState extends Equatable {
  final Transaction transaction;
  final Merchant merchant;
  MerchantState({this.transaction, this.merchant});
}

class MerchantInitial extends MerchantState {
  final Merchant merchant = Merchant(budget: 10.0, numberOfPeppers: 0);
  MerchantInitial();

  @override
  List<Object> get props => [];
}

class MerchantDidAction extends MerchantState {
  final Transaction transaction;
  final Merchant merchant;
  MerchantDidAction({@required this.transaction, @required this.merchant})
      : super(
          transaction: transaction,
          merchant: merchant,
        );

  @override
  List<Object> get props => [transaction];
}

class LostGame extends MerchantState {
  LostGame();

  @override
  List<Object> get props => [];
}
