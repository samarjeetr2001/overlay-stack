import 'package:flutter/material.dart';

class IconWithBackground extends StatelessWidget {
  final IconData icon;
  final double size;

  /// to restrict developer to use predefine IconWithBackground
  @protected
  const IconWithBackground._({
    required this.icon,
    required this.size,
  });

  @protected
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorScheme.onSurface,
      ),
      child: Center(
        child: Icon(icon, size: size),
      ),
    );
  }

  /// size of icon is 18
  factory IconWithBackground.large({required IconData icon}) {
    return IconWithBackground._(icon: icon, size: 18);
  }

  /// size of icon is 14
  factory IconWithBackground.regular({required IconData icon}) {
    return IconWithBackground._(icon: icon, size: 14);
  }
}
