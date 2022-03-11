
part of 'calculator_bloc.dart';

enum ActiveOperation {
  none,
  sum,
  substraction,
  multiplication,
  division
}

// @immutable
class CalculatorState {
  final String operand1;
  final String operation;
  final String operand2;
  final String result;
  final ActiveOperation activeOperation;

  const CalculatorState({
    this.operand1  = '', 
    this.operation = '', 
    this.operand2  = '', 
    this.result    = '',
    this.activeOperation = ActiveOperation.none
  });

  CalculatorState copyWith({
    String? operand1,
    String? operation,
    String? operand2,
    String? result,
    ActiveOperation? activeOperation
  }) => CalculatorState(
    operand1: operand1 ?? this.operand1,
    operation: operation ?? this.operation,
    operand2: operand2 ?? this.operand2,
    result: result ?? this.result,
    activeOperation: activeOperation ?? this.activeOperation
  );
}

//-Se pueden crear cada uno de los posibles estados con sus variaciones en la clase original, recibiendo parametros
//-y asignandolos al constructor super para devolver el nuevo estado, pero se estaria haciendo trabajo de mas
//-asi que se dejara la clase como no abstracta y solo se obtendra un nuevo estado del estado original con diferetnes datos 
//-sin la clase abstracta
// class CalculatorInitialState extends CalculatorState {}
// class CalculatorWithOneOperandState extends CalculatorState {}
// class CalculatorWithOperationState extends CalculatorState {}
// class CalculatorWithTwoOperandState extends CalculatorState {}
// class CalculatorWithResultState extends CalculatorState {}
