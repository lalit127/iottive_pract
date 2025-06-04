import 'package:flutter/material.dart';
import 'package:iottive_pract/models/order_model.dart';
import 'package:iottive_pract/screens/home/widgets/order_card_widget.dart';

class OrderListWidget extends StatelessWidget {
  final List<OrderModel> orders;
  final ScrollController verticalController;
  final List<ScrollController> horizontalControllers;

  const OrderListWidget({
    super.key,
    required this.orders,
    required this.verticalController,
    required this.horizontalControllers,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: verticalController,
      thumbVisibility: true,
      trackVisibility: true,
      thickness: 6,
      radius: const Radius.circular(8),
      interactive: true,
      child: ListView.builder(
        controller: verticalController,
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          final ScrollController horizontalController = ScrollController();
          horizontalControllers.add(horizontalController);
          return OrderCardWidget(
            order: order,
            horizontalController: horizontalController,
          );
        },
      ),
    );
  }
}
