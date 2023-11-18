import 'package:flutter/material.dart';
import 'package:flutter_application/module/bloc/emi_selection_bloc.dart';
import 'package:flutter_application/module/bloc/emi_selection_state.dart';
import 'package:flutter_application/module/view/widget/account_selection_widget.dart';
import 'package:flutter_application/module/view/widget/emi_option_widget.dart';
import 'package:flutter_application/module/view/widget/loan_amount_selection_widget.dart';
import 'package:flutter_application/components/icon_with_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/emi_selection_event.dart';

class EmiSelectionScreen extends StatefulWidget {
  const EmiSelectionScreen({super.key});

  @override
  State<EmiSelectionScreen> createState() => _EmiSelectionScreenState();
}

class _EmiSelectionScreenState extends State<EmiSelectionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<EmiSelectionBloc>().fetchEmiSelectionData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    final colorScheme = theme.colorScheme;
    const collapsedHeight = 100.0;
    final maxheight = mediaQuery.size.height -
        80 -
        mediaQuery.padding.bottom -
        mediaQuery.padding.top;

    return BlocBuilder<EmiSelectionBloc, EmiSelectionState>(
      builder: (context, state) {
        final bloc = context.read<EmiSelectionBloc>();

        return WillPopScope(
          onWillPop: () async {
            if (bloc.state is SaveUserAccountState) {
              bloc.add(EditBankEvent());
            } else if (bloc.state is SaveEmiOptionState) {
              bloc.add(EditEmiOptionEvent());
            } else if (bloc.state is SaveLoanAmountState) {
              bloc.add(EditLoanAmountEvent());
            } else {
              return true;
            }
            return false;
          },
          child: Scaffold(
            backgroundColor: colorScheme.tertiaryContainer,
            body: ListView(
              children: [
                /// Top bar
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  height: 80,
                  color: colorScheme.background,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconWithBackground.regular(icon: Icons.close),
                      IconWithBackground.regular(icon: Icons.question_mark),
                    ],
                  ),
                ),

                /// Body
                LoanAmountSelectionWidget(
                  onExpansionChanged: (isExpanded, selectedAmount) {
                    if (isExpanded) {
                      bloc.add(SaveLoanAmountEvent(selectedAmount));
                    } else {
                      bloc.add(EditLoanAmountEvent());
                    }
                  },
                  maxheight: maxheight,
                ),
                EmiOptionWiget(
                  onExpansionChanged: (isExpanded, selectedEmi) {
                    if (isExpanded) {
                      bloc.add(SaveEmiOptionEvent(selectedEmi));
                    } else {
                      bloc.add(EditEmiOptionEvent());
                    }
                  },
                  maxheight: maxheight - collapsedHeight,
                ),
                AccountSelectionWidget(
                  onExpansionChanged: (isExpanded, selectedBank) {},
                  maxheight: maxheight - 2 * collapsedHeight,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
