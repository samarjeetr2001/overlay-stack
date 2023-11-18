import 'package:flutter/material.dart';
import 'package:flutter_application/module/bloc/emi_selection_bloc.dart';
import 'package:flutter_application/module/bloc/emi_selection_state.dart';
import 'package:flutter_application/module/model/emi_option_model.dart';
import 'package:flutter_application/components/emi_option_card.dart';
import 'package:flutter_application/module/view/widget/title_widget.dart';
import 'package:flutter_application/utils/app_utils.dart';
import 'package:flutter_application/components/animated_expandable_tile.dart';
import 'package:flutter_application/components/secondary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmiOptionWiget extends StatefulWidget {
  final void Function(bool, EmioptionModel) onExpansionChanged;
  final double maxheight;
  const EmiOptionWiget(
      {super.key, required this.onExpansionChanged, required this.maxheight});

  @override
  State<EmiOptionWiget> createState() => _EmiOptionWigetState();
}

class _EmiOptionWigetState extends State<EmiOptionWiget> {
  EmioptionModel? selectedEmi;
  @override
  Widget build(BuildContext context) {
    final _ = context.read<EmiSelectionBloc>().state;
    final SaveLoanAmountState? currentState =
        _ is SaveLoanAmountState ? _ : null;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    selectedEmi ??= currentState?.emiSelectionDetails.emiOptions.first;
    return Visibility(
      visible: currentState is SaveLoanAmountState,
      child: AnimatedExpansionTile(
        collapsedBody: [
          Row(
            children: [
              Expanded(
                child: TitleWidget(
                  label: 'EMI',
                  value: currentState is SaveLoanAmountState
                      ? '${Utils.getDisplayAmount(
                          currentState.selectedEmi.amount,
                        )} /mo'
                      : '',
                ),
              ),
              Expanded(
                child: TitleWidget(
                  label: 'duration',
                  value: currentState is SaveLoanAmountState
                      ? '${currentState.selectedEmi.durationInMonth} months'
                      : '',
                ),
              ),
            ],
          )
        ],
        ctaLabel: 'Select your bank account',
        isCollapsed: currentState is SaveEmiOptionState,
        expandedBody: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'how do you wish to repay?',
                          style: textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'choose one of our recommended plans or make your own ',
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20),
                        for (final option
                            in currentState?.emiSelectionDetails.emiOptions ??
                                [])
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 25),
                            child: EmiSelectionCard(
                              model: option,
                              isSelected: selectedEmi?.id == option.id,
                              onPressed: () {
                                setState(() {
                                  selectedEmi = option;
                                });
                              },
                            ),
                          ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SecondaryButton(
                      label: 'Create tour own plan',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
        onExpansionChanged: (isExpanded) {
          widget.onExpansionChanged(isExpanded, selectedEmi!);
        },
        expandedHeight: widget.maxheight,
      ),
    );
  }
}
