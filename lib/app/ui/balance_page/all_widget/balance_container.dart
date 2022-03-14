import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';

class BalanceContainer extends StatelessWidget {
  const BalanceContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 0.25.sh,
      width: double.infinity,

      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(kDefaultMargin.sh*2),bottomRight: Radius.circular(kDefaultMargin.sh*2))
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_balance_wallet,
            size: 60.sp,
            color: Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(height: kDefaultMargin.sh,),
          Text("လက်ကျန်ငွေ",style: TextStyle(fontSize: kMediumFontSize14.sp,color: Theme.of(context).colorScheme.primaryContainer),),
          Text("100000 ကျပ်",style: TextStyle(fontSize: kExtraLargeFontSize18.sp,color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
