import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';

class TransferHistory extends StatelessWidget {
  const TransferHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (_, position) {
              return Container(
                width: double.infinity,
                height: 0.14.sh,
                padding: EdgeInsets.all(kDefaultMargin.sh),
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultMargin.sh, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.h),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "3.1.2022",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          fontSize: kLargeFontSize16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                        child: Text(
                      "Receipet of payment in the amount 50,000 MMK made using bank transfer",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          fontSize: kMediumFontSize14.sp),
                    )),
                  ],
                ),
              );
            }));
  }
}
