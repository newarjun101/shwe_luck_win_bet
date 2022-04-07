import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'build_help_call _button.dart';

class BuildHelpList extends StatelessWidget {
  const BuildHelpList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(kDefaultMargin.sh),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.5, color: Theme.of(context).colorScheme.secondary),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff0575e6),
                    Theme.of(context).primaryColor
                    //add more colors for gradient
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  //set the stops number equal to numbers of color
                ),

               // borderRadius: BorderRadius.circular(0.016.sh)
              shape: BoxShape.circle
            ),
            padding: EdgeInsets.all(kDefaultMargin.sh),
            child: Icon(
              Icons.support_agent_outlined,
              color: Theme.of(context).colorScheme.secondary,
              size: kExtraBigLargeFontSize24.sp*3,
            ),
          ),

          SizedBox(height: kDefaultMargin.sh,),

          Text("Request for help",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primaryVariant,
                  fontWeight: FontWeight.bold,
                  fontSize: kExtraLargeFontSize18.sp)),
          SizedBox(height: 4.h,),
          Text("who gives great service gets great rewards",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primaryContainer,
                 // fontWeight: FontWeight.bold,
                  fontSize: kLargeFontSize16.sp)),
          SizedBox(height: kDefaultMargin.sh,),
        BuildHelpCallButton(phone: '+95998775553', title: 'Call Now', onPress: () {  },),
          SizedBox(height: kDefaultMargin.sh,),
          BuildHelpCallButton(phone: '+95998775553', title: 'Call Now', onPress: () {  },),
        ],
      ),
    );
  }
}
