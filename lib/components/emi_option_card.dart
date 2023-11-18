import 'package:flutter/material.dart';
import 'package:flutter_application/module/model/emi_option_model.dart';
import 'package:flutter_application/utils/app_utils.dart';
import 'package:flutter_application/components/icon_with_background.dart';
import 'package:flutter_application/components/tag.dart';

class EmiSelectionCard extends StatelessWidget {
  final EmioptionModel model;
  final bool isSelected;
  final void Function() onPressed;
  const EmiSelectionCard(
      {super.key,
      required this.model,
      required this.isSelected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 180,
            height: 180,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withOpacity(0.8),
                    offset: const Offset(0.0, 1.0),
                    blurRadius: 2.0,
                  ),
                  BoxShadow(
                    color: colorScheme.shadow.withOpacity(0.3),
                    offset: const Offset(0.0, 1.0),
                    blurRadius: 3.0,
                    spreadRadius: 1.0,
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                isSelected
                    ? IconWithBackground.large(
                        icon: Icons.check,
                      )
                    : Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                const Spacer(),
                Text.rich(
                  TextSpan(
                    text: Utils.getDisplayAmount(model.amount),
                    style: textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: ' / mo',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'for ${model.durationInMonth} months',
                  style: textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                Text(
                  'See calculations',
                  style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ),
        if (model.isRecommended)
          const Positioned(
            top: -10,
            child: Tag(label: 'recommended'),
          ),
      ],
    );
  }
}
