import 'package:bloc_calculator_app/src/bloc/calculator_bloc.dart';
import 'package:bloc_calculator_app/src/screens/calculator_screen_2.dart';
import 'package:flutter/material.dart';

import 'package:bloc_calculator_app/src/screens/calculator_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black
        ),
        home: const CalculatorScreen2(),
      ),
    );
  }
}
