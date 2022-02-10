import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/default_values.dart';

class CardButtonContainer extends StatelessWidget {
  final String title;
  final bool isComming;
  final VoidCallback onClick;

  const CardButtonContainer(
      {Key? key,
      required this.title,
      required this.isComming,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.45.sw,
      height: 0.2 .sh,
      margin: EdgeInsets.all(kDefaultMargin.sh),
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
          borderRadius: BorderRadius.circular(0.016.sh)),
      child: Column(
        children: [
          isComming
              ?
        Container(
              width: double.infinity,
                // padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: const Color(0xffFC4F4F),
                  border: Border.all(
                      width: 3,  color: const Color(0xffFC4F4F),),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(0.013.sh),topRight: Radius.circular(0.013.sh))
              ),

              child: Center(
                  child: Text(
                "Comming Soon",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                    fontSize: kLargeFontSize16.sp,
                    fontWeight: FontWeight.bold),
              )),
            )
              : SizedBox(),
          Flexible(
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                  fontSize: 32.sp,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
