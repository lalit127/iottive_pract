import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:iottive_pract/blocs/home/home_event.dart';
import 'package:iottive_pract/blocs/home/home_state.dart';
import 'package:iottive_pract/models/order_model.dart';
import 'package:iottive_pract/repositories/home_repository.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  List<OrderModel> _allOrders = [];

  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<FetchOrders>((event, emit) async {
      emit(HomeLoading());
      try {
        _allOrders = await homeRepository.fetchOrders();
        emit(HomeLoaded(_allOrders));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });

    on<FilterOrders>((event, emit) {
      final query = event.query.toLowerCase();
      if (query.isEmpty) {
        emit(HomeLoaded(_allOrders));
      } else {
        final filteredOrders =
            _allOrders.where((order) {
              return order.coolerId!.toLowerCase().contains(query) ||
                  order.paymentStatus!.toLowerCase().contains(query);
            }).toList();
        emit(HomeLoaded(filteredOrders));
      }
    });
  }
}
