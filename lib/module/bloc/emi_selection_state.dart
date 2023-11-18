import 'package:flutter_application/module/model/user_bank_model.dart';

import '../model/emi_option_model.dart';
import '../model/emi_selection_model.dart';

abstract class EmiSelectionState {}

class EmiSelectionLoadingState extends EmiSelectionState {}

class EmiSelectionErrorState extends EmiSelectionState {}

class EmiSelectionInitialState extends EmiSelectionState {
  final int selectedAmount;
  final EmioptionModel selectedEmi;
  final UserBankModel selectedAccount;
  final EmiSelectionModel emiSelectionDetails;

  EmiSelectionInitialState({
    int? selectedAmount,
    EmioptionModel? selectedEmi,
    UserBankModel? selectedAccount,
    required this.emiSelectionDetails,
  })  : selectedAmount = selectedAmount ?? emiSelectionDetails.maxLoanApproved,
        selectedEmi = selectedEmi ?? emiSelectionDetails.emiOptions.first,
        selectedAccount =
            selectedAccount ?? emiSelectionDetails.userBanks.first;
}

class SaveLoanAmountState extends EmiSelectionInitialState {
  SaveLoanAmountState({
    required super.emiSelectionDetails,
    required super.selectedAmount,
    super.selectedEmi,
    super.selectedAccount,
  });
}

class SaveEmiOptionState extends SaveLoanAmountState {
  SaveEmiOptionState({
    required super.emiSelectionDetails,
    required super.selectedEmi,
    super.selectedAmount,
    super.selectedAccount,
  });
}

class SaveUserAccountState extends SaveEmiOptionState {
  @override
  SaveUserAccountState({
    required super.emiSelectionDetails,
    required super.selectedAmount,
    required super.selectedEmi,
    required super.selectedAccount,
  });
}
