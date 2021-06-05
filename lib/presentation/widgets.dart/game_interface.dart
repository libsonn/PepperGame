import 'package:flutter/material.dart';
import 'package:pepper_game/blocs/merchant_bloc/merchant_bloc.dart';
import 'package:pepper_game/logic/enums.dart';

import 'game_interfaces/initial_interface.dart';
import 'game_interfaces/purchase_transaction_inteface.dart';
import 'game_interfaces/sale_transaction_interface.dart';

class GameInterface extends StatelessWidget {
  final MerchantState merchantState;
  GameInterface({@required this.merchantState});

  @override
  Widget build(BuildContext context) {
    if (merchantState is MerchantInitial) {
      return InitialInterface(merchantState: merchantState);
    } else if (merchantState is MerchantDidAction) {
      if (merchantState.transaction.typeOfTransaction ==
          TypeOfTransaction.PurchaseTransaction) {
        return PurchaseTransactionInterface(merchantState: merchantState);
      } else if (merchantState.transaction.typeOfTransaction ==
          TypeOfTransaction.SaleTransaction) {
        return SaleTransactionInterface(merchantState: merchantState);
      }
    }
    return Container();
  }
}
