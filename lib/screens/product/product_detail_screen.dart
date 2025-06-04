import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iottive_pract/config/app_colors.dart';
import 'package:iottive_pract/config/app_text_styles.dart';
import 'package:iottive_pract/models/order_model.dart';
import 'package:iottive_pract/utils/base_extension.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel? product;
  const ProductDetailScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product',
          style: AppTextStyles(
            context,
          ).display24W400.copyWith(color: AppColors.primaryColor),
        ),
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            isPortrait
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: product?.productOtherUrl ?? '',
                      fit: BoxFit.fitHeight,
                    ),
                    20.0.toVSB,
                    buildProductInfo(context, product: product!),
                  ],
                )
                : Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                        imageUrl: product?.productOtherUrl ?? '',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: buildProductInfo(context, product: product!),
                    ),
                  ],
                ),
      ),
    );
  }

  Widget buildProductInfo(
    BuildContext context, {
    required ProductModel product,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildInfoRow('Product name', product.productName ?? ''),
        const Divider(color: AppColors.grayDark),
        buildInfoRow('Product ID', '${product.productId}'),
        const Divider(color: AppColors.grayDark),
        buildInfoRow('Price', '\$${product.perProductPrice}'),
        const Divider(color: AppColors.grayDark),
        buildInfoRow('Count', '${product.productCount}'),
        10.0.toVSB,
        // buildAddProduct
      ],
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget buildAddProduct() {
    return ElevatedButton(onPressed: () {}, child: const Text('Add to Cart'));
  }
}
