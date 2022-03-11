import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'calculator_state.dart';
part 'calculator_event.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  num _calculate(String operand1, String operand2, ActiveOperation operation) {
    num result = 0;

    switch(operation) {
      case ActiveOperation.none:
        break;
      case ActiveOperation.sum:
        result = double.parse(operand1) + double.parse(operand2);
        break;
      case ActiveOperation.substraction:
        result = double.parse(operand1) - double.parse(operand2);
        break;
      case ActiveOperation.multiplication:
        result = double.parse(operand1) * double.parse(operand2);
        break;
      case ActiveOperation.division:
        result = double.parse(operand1) / double.parse(operand2);
        break;
    }

    if(result % 1 == 0) result = result.toInt();
    return result;
  }

  CalculatorBloc() : super(const CalculatorState()) {
    on<ResetOperation>((event, emit) => emit(const CalculatorState()));

    on<ToggleSign>((event, emit) {
      if(state.result.isNotEmpty){
        final result = state.result[0] == '-' ? state.result.substring(1) : '-' + state.result;
        emit(state.copyWith(result: result));
      }
    });

    on<DeleteOperation>((event, emit) {
      if(state.result.isNotEmpty){
        int last = 1;
        if(state.result.length == 2 && state.result[0] == '-') last = 2;
        String result = state.result.substring(0, state.result.length - last);
        emit(state.copyWith(result: result));
      }
    });

    on<WriteOperation>((event, emit) {
      if(event.number == '.' && state.result.contains('.')) return;
      final prefix = (state.result.isEmpty && event.number == '.') ? '0' : '';
      final result = prefix + state.result + event.number;
      emit(state.copyWith(result: result));
    });

    on<MathOperation>((event, emit) {
      if(state.operand1.isEmpty && state.result.isEmpty){
       //nothing
      }
      else if(state.operand1.isEmpty){
        emit(CalculatorState(operand1: state.result, operation: event.operation, activeOperation: event.activeOperation));
      } 
      else if(state.operand1.isNotEmpty && state.result.isEmpty){
        emit(state.copyWith(operand1: state.operand1, operation: event.operation, activeOperation: event.activeOperation));
      } 
      else if(state.operand2.isEmpty && state.result.isNotEmpty) {
        final result = _calculate(state.operand1, state.result, state.activeOperation);
        emit(state.copyWith(operand1: result.toString(), operation: event.operation, result: '', activeOperation: event.activeOperation));
      } 
      else if(state.operand2.isNotEmpty){
        emit(state.copyWith(operand1: state.result, operation: event.operation, result: '', operand2: '', activeOperation: event.activeOperation));
      }
    });

    on<ResultOperation>((event, emit) {
      if(state.operation.isNotEmpty && state.operand2.isEmpty && state.result.isNotEmpty){
        final result = _calculate(state.operand1, state.result, state.activeOperation);
        emit(state.copyWith(operand2: state.result, result: result.toString()));
      }
    });
  }
}