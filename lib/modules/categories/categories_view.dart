import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../app/theme/app_theme.dart';
import '../../data/local/database.dart';
import 'categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.favourites),
            icon: const Icon(Icons.favorite_border_rounded),
            tooltip: 'Favourites',
          ),
          IconButton(
            onPressed: () => Get.toNamed(Routes.cart),
            icon: const Icon(Icons.shopping_cart_outlined),
            tooltip: 'Cart',
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Obx(() {
        final categories = controller.categories;
        if (categories.isEmpty) {
          return const Center(child: Text('No categories available.'));
        }
        return GridView.builder(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.3,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Obx(() {
              return _CategoryCard(
                category: category,
                color: _palette[index % _palette.length],
                thumbnail: controller.categoryThumbnails[category.slug],
                onTap: () => controller.openProducts(category),
              );
            });
          },
        );
      }),
    );
  }
}

const _palette = [
  AppColors.primary,
  Color(0xFFE0895B),
  Color(0xFF35B4A5),
  Color(0xFFB05FD6),
  Color(0xFF4CA8E0),
  Color(0xFFE0596F),
];

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.category,
    required this.color,
    required this.thumbnail,
    required this.onTap,
  });

  final Category category;
  final Color color;
  final String? thumbnail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                clipBehavior: Clip.antiAlias,
                child: thumbnail != null
                    ? Padding(
                        padding: const EdgeInsets.all(6),
                        child: CachedNetworkImage(
                          imageUrl: thumbnail!,
                          fit: BoxFit.contain,
                          placeholder: (_, __) =>
                              Icon(Icons.category_rounded, size: 22, color: color),
                          errorWidget: (_, __, ___) =>
                              Icon(Icons.category_rounded, size: 22, color: color),
                        ),
                      )
                    : Icon(Icons.category_rounded, size: 22, color: color),
              ),
              const SizedBox(height: 10),
              Text(
                category.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
