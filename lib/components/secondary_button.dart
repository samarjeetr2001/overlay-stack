import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const SecondaryButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 1, color: colorScheme.onPrimary),
        ),
        child: Text(label, style: textTheme.bodySmall),
      ),
    );
  }
}
