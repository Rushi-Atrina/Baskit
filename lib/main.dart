import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/bindings/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BaskitApp());
}

class BaskitApp extends StatelessWidget {
  const BaskitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Baskit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialBinding: InitialBinding(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      builder: (context, child) => _AppBackdrop(child: child),
    );
  }
}

/// Soft gradient + blurred colour blobs behind every screen — the surface
/// every screen's (now-transparent) Scaffold and glass panels float over.
/// Purely decorative: the routed page (`child`) renders on top unchanged.
class _AppBackdrop extends StatelessWidget {
  const _AppBackdrop({required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(gradient: AppColors.backdropGradient),
          ),
        ),
        Positioned(
          top: -70,
          left: -60,
          child: _Blob(size: 220, color: AppColors.primary.withValues(alpha: 0.16)),
        ),
        Positioned(
          bottom: -90,
          right: -70,
          child: _Blob(size: 260, color: AppColors.amber.withValues(alpha: 0.14)),
        ),
        Positioned(
          top: 280,
          right: -80,
          child: _Blob(size: 200, color: AppColors.success.withValues(alpha: 0.12)),
        ),
        if (child != null) child!,
      ],
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
