
import 'package:bloc_calculator_app/src/bloc/calculator_bloc.dart';

enum ButtonType {
  operation,
  text
}

class Button {
  final int id;
  final String text;
  final int color;
  final bool isBig;
  // final VoidCallback onPressed; //-> Con la solucion 1 especificar los onPress al momento de renderizarlos
  final CalculatorEvent event;
  final ButtonType type;

  const Button({
    required this.id, 
    required this.text, 
    this.color = 0xff333333, 
    this.isBig = false, 
    required this.event, 
    this.type = ButtonType.text
  });

  Button copyWith({int? id, String? text, int? color, bool? isBig, CalculatorEvent? event, ButtonType? type}) => Button(
    id: id ?? this.id,
    text: text ?? this.text,
    color: color ?? this.color,
    isBig: isBig ?? this.isBig,
    // onPressed: onPressed ?? this.onPressed
    event: event ?? this.event,
    type: type ?? this.type
  );

  static  final buttons = [
    //-Row 1
    Button(id: 1, text: 'AC',  color: 0xffA5A5A5, event: ResetOperation(),      type: ButtonType.operation),
    Button(id: 2, text: '+/-', color: 0xffA5A5A5, event: ToggleSign(),          type: ButtonType.operation),
    Button(id: 3, text: 'del', color: 0xffA5A5A5, event: DeleteOperation(),     type: ButtonType.operation),
    Button(id: 4, text: '÷',   color: 0xffF0A23B, event: MathOperation('÷', ActiveOperation.division), type: ButtonType.operation),

    //-Row 2
    Button(id: 5, text: '7', event: WriteOperation('7')),
    Button(id: 6, text: '8', event: WriteOperation('8')),
    Button(id: 7, text: '9', event: WriteOperation('9')),
    Button(id: 8, text: 'x', event: MathOperation('x', ActiveOperation.multiplication), color: 0xffF0A23B, type: ButtonType.operation),

    //-Row 3
    Button(id: 9,  text: '4', event: WriteOperation('4')),
    Button(id: 10, text: '5', event: WriteOperation('5')),
    Button(id: 11, text: '6', event: WriteOperation('6')),
    Button(id: 12, text: '-', event: MathOperation('-', ActiveOperation.substraction), color: 0xffF0A23B, type: ButtonType.operation),

    //-Row 4
    Button(id: 13, text: '1', event: WriteOperation('1')),
    Button(id: 14, text: '2', event: WriteOperation('2')),
    Button(id: 15, text: '3', event: WriteOperation('3')),
    Button(id: 16, text: '+', event: MathOperation('+', ActiveOperation.sum), color: 0xffF0A23B, type: ButtonType.operation),

    //-Row 5
    Button(id: 17, text: '0', event: WriteOperation('0'), isBig: true,),
    Button(id: 18, text: '.', event: WriteOperation('.')),
    Button(id: 19, text: '=', event: ResultOperation(), color: 0xffF0A23B, type: ButtonType.operation),
  ];
}

