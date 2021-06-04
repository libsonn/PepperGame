import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pepper_game/blocs/calculation_bloc/calculation_bloc.dart';
import 'package:pepper_game/blocs/merchant_bloc/merchant_bloc.dart';
import 'package:pepper_game/colors.dart';
import 'package:pepper_game/presentation/widgets.dart/custom_button.dart';

class SellPeppersPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1',
                style: TextStyle(
                  color: blueComponentsColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              BlocBuilder<CalculationBloc, CalculationState>(
                builder: (context, state) {
                  return CupertinoSlider(
                    min: 1,
                    max: 25,
                    value:
                        state.calculationModel.numberOfPeppersToSell.toDouble(),
                    divisions: 24,
                    thumbColor: blueComponentsColor,
                    activeColor: blueComponentsColor,
                    onChanged: (value) {
                      BlocProvider.of<CalculationBloc>(context).add(
                        ChangedNumbersOfPeppersToSell(
                          numberOfPeppersToSell: value.round(),
                        ),
                      );
                    },
                  );
                },
              ),
              Text(
                '25',
                style: TextStyle(
                  color: blueComponentsColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          BlocBuilder<CalculationBloc, CalculationState>(
            builder: (context, state) {
              return CustomButton(
                  onPressed: () {
                    BlocProvider.of<MerchantBloc>(context).add(
                      SellPeppers(
                        quantity: state.calculationModel.numberOfPeppersToSell,
                      ),
                    );
                  },
                  text: state.calculationModel.numberOfPeppersToSell != 1
                      //TODO usunąć round
                      ? 'Sell ${state.calculationModel.numberOfPeppersToSell.round()} peppers'
                      : 'Sell ${state.calculationModel.numberOfPeppersToSell.round()} pepper');
            },
          ),
        ],
      ),
    );
  }
}
