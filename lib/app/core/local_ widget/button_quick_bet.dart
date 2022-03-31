import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/default_values.dart';

class ButtonQuickBet extends StatelessWidget {

  final String title;
  final double radius;
  final Color bgColor;
  final Color textColor;
  final double fontSize;
  final VoidCallback onPress;
  final double height;
  final double width;
  const ButtonQuickBet({Key? key, required this.title, required this.radius, required this.bgColor,
    required this.textColor, required this.fontSize, required this.onPress,
    required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height.sh,
        width: width.sh,
        decoration: BoxDecoration(
          //     color: bettingPageController.selectedIndex.value== index?Theme.of(context).colorScheme.secondary: Color(0xff0F2810).withOpacity(0.9) ,
          borderRadius: BorderRadius.circular(radius.sh),
          color: bgColor,
          //  border: Border.all(color: Colors.grey.withOpacity(0.8))
        ),
        //padding: EdgeInsets.all(0.01.sh),
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.onPrimary,
          onTap: onPress,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
