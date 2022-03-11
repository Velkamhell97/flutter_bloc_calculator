
part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class WriteOperation extends CalculatorEvent {
  final String number;
  WriteOperation(this.number);
}

class MathOperation extends CalculatorEvent {
  final String operation;
  final ActiveOperation activeOperation;
  MathOperation(this.operation, this.activeOperation);
}

class ResultOperation extends CalculatorEvent {}

//-Para resetear se devuelve el estado inicial
class ResetOperation extends CalculatorEvent {}

class ToggleSign extends CalculatorEvent {}

class DeleteOperation extends CalculatorEvent {}
