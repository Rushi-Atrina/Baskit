import 'dart:ui';

import 'package:flutter/material.dart';

/// Frosted-glass app bar: blurs whatever scrolls underneath instead of
/// letting it bleed through a plain translucent background. Forwards the
/// same properties [AppBar] call sites in this app actually use, so it's a
/// drop-in swap — no behavioural change.
class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlassAppBar({super.key, this.title, this.actions, this.leading});

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: AppBar(
          title: title,
          actions: actions,
          leading: leading,
          backgroundColor: Colors.white.withValues(alpha: 0.4),
        ),
      ),
    );
  }
}
