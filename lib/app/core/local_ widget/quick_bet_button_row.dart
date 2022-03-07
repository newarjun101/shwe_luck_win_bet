import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/button_quick_bet.dart';

class QuickBetButtonRow extends StatelessWidget {
  final List<dynamic> mDataList;
  final VoidCallback onPress;

  const QuickBetButtonRow(
      {Key? key, required this.mDataList, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: mDataList
          .map((e) => Padding(
                padding: EdgeInsets.only(left: 2.h, right: 2.h,top: 2.h),
                child: ButtonQuickBet(
                    title: e.toString(),
                    radius: 0.009,
                    bgColor: Theme.of(context).colorScheme.onSecondary,
                    textColor: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: kMediumFontSize14,
                    onPress: onPress,
                    height: 0.05,
                    width: 0.055),
              ))
          .toList(),
    );
  }
}
