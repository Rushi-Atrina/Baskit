import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.product.value?.title ?? '')),
        actions: [
          Obx(
            () => IconButton(
              onPressed: controller.toggleFavourite,
              icon: Icon(
                controller.isFavourite.value ? Icons.favorite : Icons.favorite_border,
                color: controller.isFavourite.value ? Colors.red : null,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        final product = controller.product.value;
        if (product == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final theme = Theme.of(context);
        return ListView(
          children: [
            _ImageCarousel(controller: controller),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title, style: theme.textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    children: [
                      if (product.brand != null) Chip(label: Text(product.brand!)),
                      Chip(label: Text(product.category)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: theme.textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      if (product.discountPercentage > 0) ...[
                        const SizedBox(width: 8),
                        Text(
                          '-${product.discountPercentage.toStringAsFixed(0)}%',
                          style: theme.textTheme.titleMedium?.copyWith(color: Colors.green),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      Text(product.rating.toStringAsFixed(1)),
                      const SizedBox(width: 16),
                      Text(
                        product.stock > 0 ? 'In stock: ${product.stock}' : 'Out of stock',
                        style: TextStyle(
                          color: product.stock > 0 ? null : theme.colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('Description', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(product.description),
                  const SizedBox(height: 96),
                ],
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        final product = controller.product.value;
        if (product == null) return const SizedBox.shrink();
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton.icon(
              onPressed: product.stock > 0 ? controller.addToCart : null,
              icon: const Icon(Icons.add_shopping_cart),
              label: Text(
                controller.cartQuantity.value > 0
                    ? 'Add More (${controller.cartQuantity.value} in cart)'
                    : 'Add To Cart',
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _ImageCarousel extends StatelessWidget {
  const _ImageCarousel({required this.controller});

  final ProductDetailsController controller;

  @override
  Widget build(BuildContext context) {
    final images = controller.images;
    return SizedBox(
      height: 280,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            itemCount: images.length,
            onPageChanged: (i) => controller.carouselIndex.value = i,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: images[index],
                fit: BoxFit.contain,
                errorWidget: (_, __, ___) => const Icon(Icons.image_not_supported, size: 48),
              );
            },
          ),
          if (images.length > 1)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(images.length, (i) {
                    final active = i == controller.carouselIndex.value;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: active ? 10 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: active
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outlineVariant,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
