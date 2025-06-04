import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iottive_pract/utils/app_routes.dart';
import 'package:iottive_pract/utils/base_extension.dart';

class ProductListWidget extends StatelessWidget {
  final List<dynamic> products;
  final ScrollController controller;

  const ProductListWidget({
    super.key,
    required this.products,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Scrollbar(
        controller: controller,
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 4,
        radius: const Radius.circular(8),
        interactive: true,
        scrollbarOrientation: ScrollbarOrientation.bottom,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: products.length,
            separatorBuilder: (context, index) => 10.0.toHSB,
            itemBuilder: (context, productIndex) {
              final product = products[productIndex];
              return GestureDetector(
                onTap: () {
                  context.push(Routes.productDetail, extra: product);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    padding: EdgeInsets.all(2),
                    child: CachedNetworkImage(
                      imageUrl: product.productOtherUrl ?? '',
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.1),
                          child: const Icon(Icons.error, color: Colors.red),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
