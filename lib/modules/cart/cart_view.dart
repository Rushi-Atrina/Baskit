import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/theme/app_theme.dart';
import '../../data/local/daos/cart_dao.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_container.dart';
import 'cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlassAppBar(title: Text('Cart')),
      body: Obx(() {
        if (controller.lines.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 48,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(height: 14),
                const Text(
                  'Your cart is empty.',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
          itemCount: controller.lines.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) => _CartLineTile(line: controller.lines[index]),
        );
      }),
      bottomNavigationBar: Obx(() {
        if (controller.lines.isEmpty) return const SizedBox.shrink();
        return SafeArea(
          child: GlassContainer(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            opacity: 0.55,
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 16,
                offset: const Offset(0, -4),
              ),
            ],
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
                  valueColor: AppColors.success,
                ),
                const Divider(height: 24),
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
    return GlassContainer(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ColoredBox(
                color: AppColors.background,
                child: CachedNetworkImage(
                  imageUrl: product.thumbnail,
                  width: 68,
                  height: 68,
                  fit: BoxFit.contain,
                  errorWidget: (_, __, ___) => const Icon(Icons.image_not_supported_outlined),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)} each',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _QtyButton(
                        icon: Icons.remove_rounded,
                        onTap: () => controller.decrement(product.id, line.quantity),
                      ),
                      SizedBox(
                        width: 28,
                        child: Text(
                          '${line.quantity}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      _QtyButton(
                        icon: Icons.add_rounded,
                        onTap: () => controller.increment(product.id),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => controller.remove(product.id),
              icon: const Icon(Icons.delete_outline_rounded, color: AppColors.error),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  const _QtyButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 16, color: AppColors.primary),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.emphasize = false,
    this.valueColor,
  });

  final String label;
  final String value;
  final bool emphasize;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final labelStyle = emphasize
        ? Theme.of(context).textTheme.titleMedium
        : Theme.of(context).textTheme.bodyMedium;
    final valueStyle = emphasize
        ? Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.primary)
        : Theme.of(context).textTheme.bodyMedium?.copyWith(color: valueColor);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: labelStyle), Text(value, style: valueStyle)],
      ),
    );
  }
}
