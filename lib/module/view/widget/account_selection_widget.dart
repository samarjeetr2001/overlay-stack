import 'package:flutter/material.dart';
import 'package:flutter_application/module/bloc/emi_selection_bloc.dart';
import 'package:flutter_application/module/bloc/emi_selection_state.dart';
import 'package:flutter_application/module/model/user_bank_model.dart';
import 'package:flutter_application/components/user_bank_tile.dart';
import 'package:flutter_application/components/animated_expandable_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSelectionWidget extends StatefulWidget {
  final void Function(bool, UserBankModel) onExpansionChanged;
  final double maxheight;

  const AccountSelectionWidget(
      {super.key, required this.onExpansionChanged, required this.maxheight});

  @override
  State<AccountSelectionWidget> createState() => _AccountSelectionWidgetState();
}

class _AccountSelectionWidgetState extends State<AccountSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    final _ = context.read<EmiSelectionBloc>().state;
    final SaveEmiOptionState? currentState = _ is SaveEmiOptionState ? _ : null;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Visibility(
      visible: currentState is SaveEmiOptionState,
      child: AnimatedExpansionTile(
        collapsedBody: const [],
        ctaLabel: 'Tap for 1-click KYC',
        isCollapsed: currentState is SaveUserAccountState,
        expandedBody: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'where should we senf the money?',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'amount will be credited to this bank account, '
                    'EMI will also be debited from this bank account',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(height: 25),
                  for (final bank
                      in currentState?.emiSelectionDetails.userBanks ?? [])
                    UserBankTile(model: bank),
                ],
              ),
            ),
          ),
        ],
        onExpansionChanged: (isExpanded) {},
        expandedHeight: widget.maxheight,
      ),
    );
  }
}
