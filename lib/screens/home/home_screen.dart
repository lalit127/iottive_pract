import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iottive_pract/blocs/connectivity/connectivity_bloc.dart';
import 'package:iottive_pract/blocs/connectivity/connectivity_state.dart';
import 'package:iottive_pract/blocs/home/home_bloc.dart';
import 'package:iottive_pract/blocs/home/home_event.dart';
import 'package:iottive_pract/blocs/home/home_state.dart';
import 'package:iottive_pract/config/app_colors.dart';
import 'package:iottive_pract/config/app_text_styles.dart';
import 'package:iottive_pract/screens/home/widgets/order_list_widget.dart';
import 'package:iottive_pract/screens/home/widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _verticalController = ScrollController();
  final List<ScrollController> _horizontalControllers = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(FetchOrders());
    });
  }

  @override
  void dispose() {
    _verticalController.dispose();
    for (var controller in _horizontalControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _retryFetchOrders() {
    final connectivityState = context.read<ConnectivityBloc>().state;
    if (connectivityState is ConnectivityStatus &&
        connectivityState.hasInternet) {
      context.read<HomeBloc>().add(FetchOrders());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: AppTextStyles(
            context,
          ).display24W400.copyWith(color: AppColors.primaryColor),
        ),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, connectivityState) {
          bool hasInternet = false;
          if (connectivityState is ConnectivityStatus) {
            hasInternet = connectivityState.hasInternet;
          }

          if (!hasInternet) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No internet connection.'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _retryFetchOrders,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading || state is HomeInitial) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                } else if (state is HomeLoaded) {
                  final orders = state.orders;
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SearchBarWidget(
                          onChanged: (value) {
                            if (hasInternet) {
                              context.read<HomeBloc>().add(FilterOrders(value));
                            }
                          },
                        ),
                        Expanded(
                          child: OrderListWidget(
                            orders: orders,
                            verticalController: _verticalController,
                            horizontalControllers: _horizontalControllers,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Something went wrong while fetching orders.',
                          style: AppTextStyles(context).display24W400,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _retryFetchOrders,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
