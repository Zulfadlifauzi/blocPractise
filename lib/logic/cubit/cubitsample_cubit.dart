import 'package:bloc/bloc.dart';

part 'cubitsample_state.dart';

class CounterCubit extends Cubit<CubitState> {
  CounterCubit() : super(CubitState(counterValue: 0));

  void increment() => emit(CubitState(counterValue: state.counterValue + 1));
  void decrement() => emit(CubitState(counterValue: state.counterValue - 1));
}
