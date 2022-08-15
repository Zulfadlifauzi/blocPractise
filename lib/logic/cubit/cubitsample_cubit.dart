import 'dart:async';

import 'package:appbloc/constants/enums.dart';
import 'package:appbloc/logic/cubit/internet_cubit.dart';
import 'package:bloc/bloc.dart';

part 'cubitsample_state.dart';

class CubitIncrementDecrement extends Cubit<CubitState> {
  InternetCubit? internetCubits;
  StreamSubscription? internetStreamSubscription;

  CubitIncrementDecrement({
    this.internetCubits,
  }) : super(CubitState(counterValue: 0)) {
    MonitorInternetCubit();
  }

  StreamSubscription<dynamic>? MonitorInternetCubit() {
    return internetStreamSubscription = internetCubits?.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(CubitState(counterValue: state.counterValue + 1));
  void decrement() => emit(CubitState(counterValue: state.counterValue - 1));
  @override
  Future<void> close() {
    return super.close();
  }
}
