import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LotteryResult extends StatelessWidget {
  const LotteryResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ဒီနေ့ထွက်",
          style: TextStyle(
            shadows: [
              Shadow(
                  color: Theme.of(context).colorScheme.secondary,
                  offset: const Offset(0, -20))
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
            Column(
              children: [
                Text("36",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 42.sp,
                        fontWeight: FontWeight.bold)),
                Text("12:00 နံပါတ်",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: kExtraLargeFontSize18.sp,
                        fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(
              width: kDefaultMargin.sw,
            ),
            Column(
              children: [
                Text("36",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 42.sp,
                        fontWeight: FontWeight.bold)),
                Text("၄:၃၀ ဂဏန်း",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: kExtraLargeFontSize18.sp,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ],
        )
      ],
    );
  }
}
