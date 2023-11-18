import 'package:flutter/material.dart';
import 'package:flutter_application/module/bloc/emi_selection_bloc.dart';
import 'package:flutter_application/module/bloc/emi_selection_state.dart';
import 'package:flutter_application/components/amount_slider.dart';
import 'package:flutter_application/module/view/widget/title_widget.dart';
import 'package:flutter_application/utils/app_utils.dart';
import 'package:flutter_application/components/animated_expandable_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoanAmountSelectionWidget extends StatefulWidget {
  final void Function(bool, int) onExpansionChanged;
  final double maxheight;

  const LoanAmountSelectionWidget(
      {super.key, required this.onExpansionChanged, required this.maxheight});

  @override
  State<LoanAmountSelectionWidget> createState() =>
      _LoanAmountSelectionWidgetState();
}

class _LoanAmountSelectionWidgetState extends State<LoanAmountSelectionWidget> {
  int? selectedAmount;

  @override
  Widget build(BuildContext context) {
    final _ = context.read<EmiSelectionBloc>().state;
    final EmiSelectionInitialState? currentState =
        _ is EmiSelectionInitialState ? _ : null;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    selectedAmount ??= currentState?.emiSelectionDetails.maxLoanApproved;

    return Visibility(
      visible: currentState is EmiSelectionInitialState,
      child: AnimatedExpansionTile(
        collapsedBody: [
          TitleWidget(
            label: 'credit amount',
            value: currentState is EmiSelectionInitialState
                ? Utils.getDisplayAmount(currentState.selectedAmount)
                : '',
          ),
        ],
        ctaLabel: 'Proceed to EMI selection',
        isCollapsed: currentState is SaveLoanAmountState,
        expandedBody: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'samar, how much do you need?',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'move the dial and set any amount you need'
                    ' upto ${Utils.getDisplayAmount((currentState)?.emiSelectionDetails.maxLoanApproved ?? 0)}',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    decoration: BoxDecoration(
                      color: colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: AmountSlider(
                            maxAmount: (currentState
                                        ?.emiSelectionDetails.maxLoanApproved ??
                                    0)
                                .toDouble(),
                            initialValue: selectedAmount?.toDouble(),
                            onChange: (value) {
                              selectedAmount = value.toInt();
                            },
                          ),
                        ),
                        Text(
                          'stash is instant. money will bw credited within seconds',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        onExpansionChanged: (isExpanded) {
          widget.onExpansionChanged(isExpanded, selectedAmount!);
        },
        expandedHeight: widget.maxheight,
      ),
    );
  }
}
