import 'dart:async';

import 'package:block_pettern_flutter/blocks/internet_blocs/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetInitialState()) {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) => {
              if (result == ConnectivityResult.mobile ||
                  result == ConnectivityResult.wifi)
                {emit(InternetGainedState())}
              else
                {emit(InternetLostState())}
            });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}
