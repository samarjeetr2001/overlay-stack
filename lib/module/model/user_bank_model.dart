import 'dart:convert';

class UserBankModel {
  final String bankId;
  final String bankName;
  final String accountNumber;

  UserBankModel({
    required this.bankId,
    required this.bankName,
    required this.accountNumber,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'bankId': bankId});
    result.addAll({'bankName': bankName});
    result.addAll({'accountNumber': accountNumber});

    return result;
  }

  factory UserBankModel.fromMap(Map<String, dynamic> map) {
    return UserBankModel(
      bankId: map['bankId'] ?? '',
      bankName: map['bankName'] ?? '',
      accountNumber: map['accountNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserBankModel.fromJson(String source) =>
      UserBankModel.fromMap(json.decode(source));
}
