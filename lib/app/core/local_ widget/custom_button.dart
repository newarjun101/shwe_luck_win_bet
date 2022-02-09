import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final Color bgColor;
  final Color textColor;
  final double radius;
  final IconData? icon;
  final bool isIcon;
  final double? iconSize;

  const CustomButton(
      {Key? key,
      required this.onClick,
      required this.title,
      required this.bgColor,
      required this.textColor,
      required this.radius,  this.icon, required this.iconSize, required this.isIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(color: textColor),),
           const SizedBox(width: 4,),
           isIcon? Icon(icon,size: iconSize,color: textColor,) : const SizedBox()
          ],
        ),
        onPressed: onClick);
  }
}
