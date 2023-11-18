import 'package:flutter/material.dart';
import 'package:flutter_application/utils/app_utils.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class AmountSlider extends StatelessWidget {
  const AmountSlider({
    super.key,
    required this.maxAmount,
    this.onChange,
    this.initialValue,
  });

  ///maxAmount is max value of the slider
  final double maxAmount;

  /// onChange will be called when value of slider changes
  final Function(double)? onChange;

  /// bydefault value of initialValue is maxAmount*0.8
  final double? initialValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final value = initialValue ?? maxAmount * 0.8;
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        animationEnabled: false,
        customColors: CustomSliderColors(
          trackColor: colorScheme.secondary.withOpacity(0.2),
          progressBarColor: colorScheme.onError,
          shadowColor: colorScheme.onError,
        ),
        customWidths: CustomSliderWidths(
          progressBarWidth: 20,
          trackWidth: 25,
        ),
      ),
      max: maxAmount,
      initialValue: value,
      onChange: onChange,
      innerWidget: (value) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'credit amount',
                style: textTheme.titleSmall
                    ?.copyWith(color: colorScheme.onSurface),
              ),
              const SizedBox(height: 5),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Text(
                  Utils.getDisplayAmount(value.isFinite ? value.toInt() : 0),
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.background,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '@ 1.04% monthly',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
