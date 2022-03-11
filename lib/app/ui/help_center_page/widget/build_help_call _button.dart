import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';

class BuildHelpCallButton extends StatelessWidget {

 final String title;
 final String phone;
  final VoidCallback onPress;
  const BuildHelpCallButton({Key? key, required this.title, required this.phone, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> print("hello world"),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
            border: Border.all(
                width: 1.5, color: Theme.of(context).colorScheme.secondary),

            borderRadius: BorderRadius.circular(0.016.sh)
           // shape: BoxShape.circle
        ),
        child: ListTile(
          title:  Text(title,
              style: TextStyle(

                  fontWeight: FontWeight.bold,
                  fontSize: kLargeFontSize16.sp)),
          subtitle: Text(phone,
              style: TextStyle(

               //   fontWeight: FontWeight.bold,
                  fontSize: kMediumFontSize14.sp)),

          leading:  CircleAvatar(
              radius: 20.h,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child:  Icon(Icons.call,size: kExtraBigLargeFontSize24.sp,)),

          trailing: Icon(Icons.swipe_down_outlined,size: kExtraBigLargeFontSize24.sp,),
        )
      ),
    );
  }
}
