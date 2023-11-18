import 'package:intl/intl.dart';

class Utils {
  /// function will convert amount to indian currency format
  /// eg: if amount passed is 150000 then function will return ₹ 1,50,000
  static String getDisplayAmount(int amount) {
    final format = NumberFormat.currency(
      name: "INR",
      locale: 'en_IN',
      decimalDigits: 0,
      symbol: '₹ ',
    );
    return format.format(amount);
  }
}
