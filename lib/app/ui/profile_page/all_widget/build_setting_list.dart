import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';

class BuildSettingList extends StatelessWidget {
  const BuildSettingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: kDefaultMargin.sh,right: kDefaultMargin.sh),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryVariant,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.h), topRight: Radius.circular(25.h))),
      child: ListView(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [

              Icon(EvaIcons.power,size: kExtraBigLargeFontSize24.sp,),
              SizedBox(width: kDefaultMargin.sh,),
              GestureDetector(
                  onTap: () {
                    GetStorage().remove(TOKEN);
                    Get.offAndToNamed(Pages.lLoginScreen);
                  },
                  child: Text("လော့အောက်",style: TextStyle(fontSize: kMediumFontSize14.sp),))
            ],
          ),
          SizedBox(
            height: kDefaultMargin.sh,
          ),
          Row(
            children: [

              Icon(Icons.edit,size: kExtraBigLargeFontSize24.sp,),
              SizedBox(width: kDefaultMargin.sh,),
              GestureDetector(
                  onTap: ()=> Get.toNamed(Pages.lEditProfile),
                  child: Text("အကောင့်ပြုပြင်ရန်",style: TextStyle(fontSize: kMediumFontSize14.sp),)),
              const Spacer(),
              Icon(Icons.keyboard_arrow_down_outlined,size: kExtraBigLargeFontSize24.sp,),
            ],
          ),
          SizedBox(
            height: kDefaultMargin.sh,
          ),
          Row(
            children: [

              Icon(Icons.source,size: kExtraBigLargeFontSize24.sp,),
              SizedBox(width: kDefaultMargin.sh,),
              Text("ရန်ညွှန်းကုဒ်",style: TextStyle(fontSize: kMediumFontSize14.sp),),
              Spacer(),
              Text("HM001",style: TextStyle(fontSize: kMediumFontSize14.sp),)
            ],
          ),
          SizedBox(
            height: kDefaultMargin.sh,
          ),
          Row(
            children: [

              Icon(Icons.account_balance_wallet,size: kExtraBigLargeFontSize24.sp,),
              SizedBox(width: kDefaultMargin.sh,),
              Text("ပိုက်ဆံအိတ်",style: TextStyle(fontSize: kMediumFontSize14.sp),),
             const Spacer(),
              Text("10000 MMK",style: TextStyle(fontSize: kMediumFontSize14.sp),)
            ],
          ),
          SizedBox(
            height: kDefaultMargin.sh,
          ),
          Row (
            children: [

              Icon(EvaIcons.flag,size: kExtraBigLargeFontSize24.sp,),
              SizedBox(width: kDefaultMargin.sh,),
              Text("ဘာသာစကား",style: TextStyle(fontSize: kMediumFontSize14.sp),),
              const Spacer(),
              Text("Myanmar",style: TextStyle(fontSize: kMediumFontSize14.sp),)
            ],
          ),
          SizedBox(
            height: kDefaultMargin.sh,
          ),
          Row(
            children: [

              Icon(Icons.bug_report,size: kExtraBigLargeFontSize24.sp,),
              SizedBox(width: kDefaultMargin.sh,),
              Text("သတင်းပေးပိုရန်",style: TextStyle(fontSize: kMediumFontSize14.sp),)
            ],
          ),
          SizedBox(
            height: kDefaultMargin.sh,
          ),
          Row(
            children: [

              Icon(Icons.app_blocking,size: kExtraBigLargeFontSize24.sp,),
              SizedBox(width: kDefaultMargin.sh,),
              Text("Version",style: TextStyle(fontSize: kMediumFontSize14.sp),),
            const Spacer(),
              Text("1.0.1 Beta",style: TextStyle(fontSize: kMediumFontSize14.sp),),
            ],
          ),
          SizedBox(
            height: kDefaultMargin.sh,
          ),
        ],
      )
    );
  }
}
