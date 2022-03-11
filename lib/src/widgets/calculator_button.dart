import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_calculator_app/src/models/button.dart';
import 'package:bloc_calculator_app/src/bloc/calculator_bloc.dart';

class CalculatorButton extends StatelessWidget {
  final Button button;

  const CalculatorButton({Key? key, required this.button}) : super(key: key);

  // VoidCallback getFunction(Button button){
  //   if(button.type == ButtonType.operation){
  //     switch(button.id){
  //       case 1:
  //         return () => print('Operation AC');
  //       case 2:
  //         return () => print('Operation +/-');
  //       case 3:
  //         return () => print('Operation del');
  //       case 4:
  //         return () => print('Operation /');
  //       case 8:
  //         return () => print('Operation X');
  //       case 12:
  //         return () => print('Operation -');
  //       case 16:
  //         return () => print('Operation +');
  //       case 19:
  //         return () => print('Operation =');
  //     }
  //   } else {
  //     return () => print(button.text);
  //   }
  //
  //   return (){};
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      // type: MaterialType.transparency,
      color: Color(button.color),
      shape: button.isBig ? const StadiumBorder() : const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // getFunction(context);
          context.read<CalculatorBloc>().add(button.event);
        },
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(button.text, style: const TextStyle(color: Colors.white),),
          )
        ),
      ),
    );
  }
}

