import 'package:bloc_calculator_app/src/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_calculator_app/src/models/button.dart';
import 'package:bloc_calculator_app/src/widgets/calculator_button.dart';

class CalculatorScreen2 extends StatelessWidget {
  const CalculatorScreen2({Key? key}) : super(key: key);

  static final _buttons = Button.buttons;

  //-Solucion 1 generar los void callback en la creacion de los botones, tambien se podria dejar en la parte
  //-del onTap en el widget en vez de como propieadd de la clase
  // VoidCallback getFunction(BuildContext context, Button button){
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
  //     return () => context.read<CalculatorBloc>().add(WriteOperation(button.text));;
  //   }
  //
  //   return (){};
  // }

  static const _style = TextStyle(color: Colors.white, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (_, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Spacer(),
                        Text(state.operand1, style: _style),
                        Text(state.operation, style: _style),
                        Text(state.operand2, style: _style),
                        const Divider(color: Colors.grey, thickness: 2),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: FittedBox(
                              alignment: Alignment.centerRight,
                              child: Text(state.result, style: _style.copyWith(fontSize: 50))
                            ),
                          )
                        ),
                      ],
                    );
                  },
                ),
              ),

              Expanded(
                flex: 7,
                child: Container(
                  // color: Colors.red.withOpacity(0.5),
                  child: Column(
                    children: [
                      ...List.generate(5, (i) {
                        return Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    ...List.generate(4, (index) {
                                      final j = (i * 4) + index;
                                      if(j == 19) return const SizedBox();
                              
                                      final button = _buttons[j];
                                      //-Con la solucion 1 se asigna el onPress (evento) de cada boton dependiendo su tipo o id
                                      // final calculatorButton = button.copyWith(onPressed: getFunction(context, button));
                                                    
                                      return Expanded(
                                        flex: button.isBig ? 2 : 1,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            // if(j != (i * 4) && j != ((i + 1) * 4) - 1)
                                            Expanded(
                                              child: CalculatorButton(
                                                // button: calculatorButton
                                                button: button,
                                              ),
                                            ),
                                            
                                          ],
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}