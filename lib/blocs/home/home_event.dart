import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchOrders extends HomeEvent {}

class FilterOrders extends HomeEvent {
  final String query;

  const FilterOrders(this.query);

  @override
  List<Object> get props => [query];
}
