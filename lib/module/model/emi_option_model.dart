import 'dart:convert';

class EmioptionModel {
  final String id;
  final int amount;
  final int durationInMonth;
  final bool isRecommended;

  EmioptionModel({
    required this.id,
    required this.amount,
    required this.durationInMonth,
    required this.isRecommended,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'amount': amount});
    result.addAll({'durationInMonth': durationInMonth});
    result.addAll({'isRecommended': isRecommended});

    return result;
  }

  factory EmioptionModel.fromMap(Map<String, dynamic> map) {
    return EmioptionModel(
      id: map['id'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      durationInMonth: map['durationInMonth']?.toInt() ?? 0,
      isRecommended: map['isRecommended'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmioptionModel.fromJson(String source) =>
      EmioptionModel.fromMap(json.decode(source));
}
