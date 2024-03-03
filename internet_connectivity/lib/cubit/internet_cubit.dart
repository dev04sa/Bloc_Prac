import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? streamSubscription;
  InternetCubit() : super(InternetInitialState()) {
    streamSubscription = _connectivity.onConnectivityChanged.listen((res) {
      if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi) {
        emit(InternetGainedState());
      } else {
        emit(InternetLostState());
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
