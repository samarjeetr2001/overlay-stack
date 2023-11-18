import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String label;
  final String value;
  const TitleWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final color = colorScheme.onSurface.withOpacity(0.95);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(color: color),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: textTheme.titleLarge?.copyWith(color: color),
        ),
      ],
    );
  }
}
