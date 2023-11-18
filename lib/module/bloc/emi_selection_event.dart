import 'package:flutter_application/module/model/emi_option_model.dart';
import 'package:flutter_application/module/model/user_bank_model.dart';

import '../model/emi_selection_model.dart';

abstract class EmiSelectionEvent {}

class EmiSelectionErrorEvent extends EmiSelectionEvent {}

class EmiSelectionInitializedEvent extends EmiSelectionEvent {
  final EmiSelectionModel emiSelectionDetails;
  EmiSelectionInitializedEvent(this.emiSelectionDetails);
}

class SaveLoanAmountEvent extends EmiSelectionEvent {
  final int selectedAmount;
  SaveLoanAmountEvent(this.selectedAmount);
}

class SaveEmiOptionEvent extends EmiSelectionEvent {
  final EmioptionModel selectedEmi;
  SaveEmiOptionEvent(this.selectedEmi);
}

class SaveBankEvent extends EmiSelectionEvent {
  final UserBankModel selectedAccount;
  SaveBankEvent(this.selectedAccount);
}

class EditLoanAmountEvent extends EmiSelectionEvent {}

class EditEmiOptionEvent extends EmiSelectionEvent {}

class EditBankEvent extends EmiSelectionEvent {}
