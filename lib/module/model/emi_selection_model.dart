import 'dart:convert';

import 'package:flutter_application/module/model/emi_option_model.dart';
import 'package:flutter_application/module/model/user_bank_model.dart';

class EmiSelectionModel {
  final int maxLoanApproved;
  final double roi;
  final List<EmioptionModel> emiOptions;
  final List<UserBankModel> userBanks;

  EmiSelectionModel({
    required this.maxLoanApproved,
    required this.roi,
    required this.emiOptions,
    required this.userBanks,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'maxLoanApproved': maxLoanApproved});
    result.addAll({'roi': roi});
    result.addAll({'emiOptions': emiOptions.map((x) => x.toMap()).toList()});
    result.addAll({'userBanks': userBanks.map((x) => x.toMap()).toList()});

    return result;
  }

  factory EmiSelectionModel.fromMap(Map<String, dynamic> map) {
    return EmiSelectionModel(
      maxLoanApproved: map['maxLoanApproved']?.toInt() ?? 0,
      roi: map['roi']?.toDouble() ?? 0.0,
      emiOptions: List<EmioptionModel>.from(
          map['emiOptions']?.map((x) => EmioptionModel.fromMap(x))),
      userBanks: List<UserBankModel>.from(
          map['userBanks']?.map((x) => UserBankModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EmiSelectionModel.fromJson(String source) =>
      EmiSelectionModel.fromMap(json.decode(source));
}
