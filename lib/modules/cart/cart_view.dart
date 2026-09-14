import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/local/daos/cart_dao.dart';
import 'cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Obx(() {
        if (controller.lines.isEmpty) {
          return const Center(child: Text('Your cart is empty.'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.lines.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) => _CartLineTile(line: controller.lines[index]),
        );
      }),
      bottomNavigationBar: Obx(() {
        if (controller.lines.isEmpty) return const SizedBox.shrink();
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _SummaryRow(label: 'Items', value: '${controller.itemCount}'),
                _SummaryRow(
                  label: 'Subtotal',
                  value: '\$${controller.subtotal.toStringAsFixed(2)}',
                ),
                _SummaryRow(
                  label: 'Discount',
                  value: '-\$${controller.discount.toStringAsFixed(2)}',
                ),
                const Divider(),
                _SummaryRow(
                  label: 'Grand Total',
                  value: '\$${controller.grandTotal.toStringAsFixed(2)}',
                  emphasize: true,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _CartLineTile extends StatelessWidget {
  const _CartLineTile({required this.line});

  final CartLine line;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();
    final product = line.product;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: product.thumbnail,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => const Icon(Icons.image_not_supported),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text('\$${product.price.toStringAsFixed(2)} each'),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => controller.decrement(product.id, line.quantity),
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text('${line.quantity}'),
                IconButton(
                  onPressed: () => controller.increment(product.id),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            IconButton(
              onPressed: () => controller.remove(product.id),
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value, this.emphasize = false});

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final style = emphasize
        ? Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
        : Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: style), Text(value, style: style)],
      ),
    );
  }
}
