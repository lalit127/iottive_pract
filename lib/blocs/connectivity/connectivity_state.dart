import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object> get props => [];
}

class ConnectivityInitial extends ConnectivityState {}

class ConnectivityStatus extends ConnectivityState {
  final bool hasInternet;
  final List<ConnectivityResult> connectionTypes;

  const ConnectivityStatus({
    required this.hasInternet,
    required this.connectionTypes,
  });

  @override
  List<Object> get props => [hasInternet, connectionTypes];
}
