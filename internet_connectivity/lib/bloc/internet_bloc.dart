import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? streamSubscription;
  InternetBloc() : super(InternetInitialState()) {
    on<InternetGainedEvent>((event, emit) {
      emit(InternetGainedState());
    });
    on<InternetLostEvent>((event, emit) {
      emit(InternetLostState());
    });
    streamSubscription = _connectivity.onConnectivityChanged.listen((res) {
      if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    streamSubscription?.cancel();
    return super.close();
  }
}
