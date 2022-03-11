import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:bloc_calculator_app/src/models/button.dart';
import 'package:bloc_calculator_app/src/widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  static final _buttons = Button.buttons;

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

  static const _style = TextStyle(color: Colors.white, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    const Text('1000', style: _style),
                    const Text('X', style: _style),
                    const Text('1000', style: _style),
                    const Divider(color: Colors.grey, thickness: 2),
                    Text('1000', style: _style.copyWith(fontSize: 50)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                  children: [
                    ..._buttons.map((button) {
                      // final calculatorButton = button.copyWith(onPressed: getFunction(button));
                      
                      return StaggeredGridTile.extent(
                        crossAxisCellCount:  button.isBig ? 2 : 1, 
                        mainAxisExtent: (size.height * 0.56) / 5, 
                        // mainAxisCellCount: 1.15,
                        child: CalculatorButton(
                          // button: calculatorButton
                          button: button,
                        )
                      );
                    })          
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}