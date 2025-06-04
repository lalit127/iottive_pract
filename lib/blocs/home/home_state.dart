import 'package:equatable/equatable.dart';
import 'package:iottive_pract/models/order_model.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<OrderModel> orders;

  HomeLoaded(this.orders);

  @override
  List<Object?> get props => [orders];
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
