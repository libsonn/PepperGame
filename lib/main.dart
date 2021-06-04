import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pepper_game/blocs/calculation_bloc/calculation_bloc.dart';
import 'package:pepper_game/blocs/merchant_bloc/merchant_bloc.dart';
import 'package:pepper_game/logic/calculation_logic.dart';
import 'package:pepper_game/logic/pepper_price_generator.dart';
import 'package:pepper_game/presentation/screens/home_page.dart';

//"https://www.flaticon.com/authors/good-ware"
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MerchantBloc(
            calculationLogic: new CalculationLogic(generator: RandomPepperPriceGenerator()),
          ),
        ),
        BlocProvider(
          create: (context) => CalculationBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pepper Game',
        home: HomePage(),
      ),
    );
  }
}
