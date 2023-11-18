import 'package:flutter/material.dart';
import 'package:flutter_application/module/model/user_bank_model.dart';
import 'package:flutter_application/components/icon_with_background.dart';

class UserBankTile extends StatelessWidget {
  final UserBankModel model;
  const UserBankTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.bankName,
                style: textTheme.titleSmall,
              ),
              Text(
                model.accountNumber,
                style: textTheme.bodySmall,
              ),
            ],
          ),
          const Spacer(),
          IconWithBackground.large(
            icon: Icons.check,
          ),
        ],
      ),
    );
  }
}
