import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String label;
  const Tag({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: colorScheme.onPrimary,
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withOpacity(0.8),
              offset: const Offset(0.0, 1.0),
              blurRadius: 3.0,
            ),
            BoxShadow(
              color: colorScheme.shadow.withOpacity(0.3),
              offset: const Offset(0.0, 4.0),
              blurRadius: 8.0,
              spreadRadius: 3.0,
            ),
          ]),
      child: Text(
        label,
        style: textTheme.bodySmall?.copyWith(color: colorScheme.surface),
      ),
    );
  }
}
