import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/button_quick_bet.dart';

class QuickBetButtonRow extends StatelessWidget {
  final String title;
  final double? width;
  final VoidCallback onPress;

  const QuickBetButtonRow(
      {Key? key, required this.title, required this.onPress, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h, right: 2.h,top: 2.h),
      child: ButtonQuickBet(
          title: title,
          radius: 0.009,
          bgColor: Theme.of(context).colorScheme.onSecondary,
          textColor: Theme.of(context).colorScheme.primaryContainer,
          fontSize: kMediumFontSize14,
          onPress: onPress,
          height: 0.05,
          width: width??0.055),
    );
  }
}
