import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LotteryResult extends StatelessWidget {
  const LotteryResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Today Result",
          style: TextStyle(
            shadows: [
              Shadow(
                  color: Theme.of(context).colorScheme.secondary,
                  offset: Offset(0, -5))
            ],
            color: Colors.transparent,
            fontSize: kExtraBigLargeFontSize24.sp,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationColor: Theme.of(context).colorScheme.secondary,
            decorationThickness: 2,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(children: [
                TextSpan(
                  text: "36\n",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 42.sp,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "Test Text",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: kExtraLargeFontSize18.sp,
                      fontWeight: FontWeight.bold))
            ])),
            SizedBox(
              width: kDefaultMargin.sw,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "36\n",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 42.sp,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "Test Text",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: kExtraLargeFontSize18.sp,
                      fontWeight: FontWeight.bold))
            ])),
          ],
        )
      ],
    );
  }
}
