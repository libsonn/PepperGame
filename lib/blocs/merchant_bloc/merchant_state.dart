part of 'merchant_bloc.dart';

@immutable
abstract class MerchantState extends Equatable {
}

class MerchantInitial extends MerchantState {
  MerchantInitial() : super();

  @override
  List<Object> get props => [];
}

class MerchantDidAction extends MerchantState {
  final Purchase purchase;
  MerchantDidAction({@required this.purchase}) : super();

  @override
  List<Object> get props => [purchase];
}

class LostGame extends MerchantState {
  LostGame() : super();

  @override
  List<Object> get props => [];
}
