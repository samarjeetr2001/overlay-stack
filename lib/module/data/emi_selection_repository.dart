import 'dart:developer';

import 'package:flutter_application/module/model/emi_selection_model.dart';

class EmiSelectionRepository {
  EmiSelectionModel? getEmiSelectionDetails() {
    try {
      return EmiSelectionModel.fromMap(
        {
          'maxLoanApproved': 150000,
          'roi': 8.9,
          'emiOptions': [
            {
              'id': 'EMI_OPTION_1',
              'amount': 4247,
              'durationInMonth': 12,
            },
            {
              'id': 'EMI_OPTION_2',
              'amount': 5580,
              'durationInMonth': 9,
              'isRecommended': true,
            },
            {
              'id': 'EMI_OPTION_3',
              'amount': 8290,
              'durationInMonth': 6,
            },
          ],
          'userBanks': [
            {
              'bankId': 'USER_BANK_1',
              'bankName': 'Paytm Payments Bank',
              'accountNumber': '919935670475',
            },
          ],
        },
      );
    } catch (e) {
      log('Error in get emi data $e', name: 'ERROR');
    }
    return null;
  }
}
