import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:iottive_pract/blocs/connectivity/connectivity_event.dart';
import 'package:iottive_pract/blocs/connectivity/connectivity_state.dart';
import 'package:iottive_pract/utils/check_internet.dart';

@injectable
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  Timer? _periodicCheckTimer;

  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityChanged>((event, emit) async {
      final hasInternet = await InternetCheck.hasInternet();

      emit(
        ConnectivityStatus(
          hasInternet: hasInternet,
          connectionTypes: event.results,
        ),
      );
    });

    _subscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      add(ConnectivityChanged(results: results));
    });

    _periodicCheckTimer = Timer.periodic(const Duration(seconds: 10), (
      timer,
    ) async {
      final results = await _connectivity.checkConnectivity();
      add(ConnectivityChanged(results: results));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _connectivity.checkConnectivity().then((results) {
        add(ConnectivityChanged(results: results));
      });
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    _periodicCheckTimer?.cancel();
    return super.close();
  }
}
