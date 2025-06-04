import 'package:flutter/material.dart';
import 'package:iottive_pract/config/app_colors.dart';
import 'package:iottive_pract/config/app_text_styles.dart';
import 'package:iottive_pract/models/order_model.dart';
import 'package:iottive_pract/screens/home/widgets/product_list_widget.dart';
import 'package:iottive_pract/utils/base_extension.dart';

class OrderCardWidget extends StatelessWidget {
  final OrderModel order;
  final ScrollController horizontalController;

  const OrderCardWidget({
    super.key,
    required this.order,
    required this.horizontalController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order ID:  ${order.coolerId}",
                      style: AppTextStyles(context).display14W400,
                    ),
                    Text(
                      "Date:  ${formatDateTime(order.date ?? DateTime.now())}",
                      style: AppTextStyles(context).display14W400,
                    ),
                    Text(
                      "Amount:  ₹${order.paidAmount}",
                      style: AppTextStyles(context).display14W400,
                    ),
                    Text(
                      "Status:  ${order.paymentStatus}",
                      style: AppTextStyles(context).display14W400,
                    ),
                    Text(
                      "No. of Product: ${order.products?.length ?? 0}",
                      style: AppTextStyles(context).display14W400,
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(onPressed: () {}, child: Text('Details')),
              ],
            ),
            const SizedBox(height: 8),
            Divider(color: AppColors.primaryColor),
            ProductListWidget(
              products: order.products ?? [],
              controller: horizontalController,
            ),
          ],
        ),
      ),
    );
  }
}
