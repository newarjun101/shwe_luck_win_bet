import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';

class OffDayList extends StatelessWidget {
  const OffDayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultMargin.sh * 2),
      padding: EdgeInsets.all(kDefaultMargin.sh),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(kDefaultMargin.sh)

      ),
      
      child: Column(
        children: [
          SizedBox(
            height: kDefaultMargin.sh,
          ),
          Text(
            "ထီပိတ်ရက်မျာ",
            style: TextStyle(
              shadows: [
                Shadow(
                    color: Theme.of(context).colorScheme.primaryContainer ,
                    offset: const Offset(0, -20))
              ],
              color: Colors.transparent,
              fontSize: kLargeFontSize16.sp,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Theme.of(context).colorScheme.secondary,
              decorationThickness: 2,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
          SizedBox(
            height: kDefaultMargin.sh,
          ),

          Flexible(child: ListView.builder(
              itemCount: 8,
              itemBuilder: (_,position) {


            return   Row(
              mainAxisSize: MainAxisSize.max,
              children: [

                Icon(EvaIcons.arrowRight,size: 20.sp,color: Theme.of(context).colorScheme.secondary,),
                SizedBox(width: 4.w,),
                Expanded(
                  flex: 2,
                  child: Text("2022 - 02 - 16 ဗုဒ္ဓဟူးနေ့",style: TextStyle(color: Theme.of(context).colorScheme.primaryContainer,
                      fontSize: kMediumFontSize14.sp,fontWeight: FontWeight.bold),),
                ),
                SizedBox(width: 4.w,),

                Expanded(
                  flex: 1,
                  child: Text("Lucifer Day",textAlign: TextAlign.end,
                    style: TextStyle(color: Theme.of(context).colorScheme.primaryContainer,
                      fontSize: kMediumFontSize14.sp,fontWeight: FontWeight.bold),),
                )
              ],
            );
          }))

        ],
      )
    );
  }
}
