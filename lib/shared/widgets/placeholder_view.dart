import 'package:flutter/material.dart';

/// Stand-in for screens not yet built in their phase (see docs/plan.md).
/// Replaced module-by-module as later phases land.
class PlaceholderView extends StatelessWidget {
  const PlaceholderView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title — coming in a later phase')),
    );
  }
}
