import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/theme/app_theme.dart';
import '../../shared/widgets/glass_container.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: AppColors.heroGradient),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GlassContainer(
                borderRadius: const BorderRadius.all(Radius.circular(28)),
                opacity: 0.6,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
                ],
                child: const SizedBox(
                  width: 96,
                  height: 96,
                  child: Icon(
                    Icons.shopping_basket_rounded,
                    size: 52,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Baskit',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 32),
              const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
