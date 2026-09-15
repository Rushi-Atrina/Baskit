import 'dart:ui';

import 'package:flutter/material.dart';

/// Frosted-glass surface: blurred backdrop + translucent tint + thin light
/// border + soft shadow. Purely decorative wrapper — drop any content in,
/// behaviour of the child is untouched.
///
/// See .claude/skills/glassmorphism/SKILL.md for the design rationale.
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.blurSigma = 18,
    this.opacity = 0.45,
    this.color = Colors.white,
    this.borderColor,
    this.borderWidth = 1.2,
    this.padding,
    this.margin,
    this.boxShadow,
    this.gradientColors,
  });

  final Widget child;
  final BorderRadius borderRadius;
  final double blurSigma;
  final double opacity;
  final Color color;
  final Color? borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? boxShadow;

  /// Optional tint gradient (defaults to a subtle diagonal fade of [color]).
  final List<Color>? gradientColors;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius;
    final fill = gradientColors ??
        [
          color.withValues(alpha: opacity),
          color.withValues(alpha: opacity * 0.6),
        ];

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 24,
                spreadRadius: -4,
                offset: const Offset(0, 8),
              ),
            ],
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: radius,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: fill,
              ),
              border: Border.all(
                color: borderColor ?? Colors.white.withValues(alpha: 0.45),
                width: borderWidth,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
