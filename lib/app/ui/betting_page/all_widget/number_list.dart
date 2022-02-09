import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<String> mNumberList = List<String>.generate(100, (counter) => "$counter");

class NumberList extends StatelessWidget {
  const NumberList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: kDefaultMargin.sh,right: kDefaultMargin.sh,top: 0.0092.sh,bottom: 0.0092.sh),
      child: GridView.builder(
          itemCount: mNumberList.length,
          itemBuilder: (context, index) {
        return Container(
            decoration: BoxDecoration(
              color: const Color(0xff0F2810),
              borderRadius: BorderRadius.circular(0.006.sh),
            ),
            padding: EdgeInsets.all(0.01.sh),
            child: InkWell(
              splashColor: Theme.of(context).colorScheme.onPrimary,
              onTap: () => print(mNumberList[index]),
              child: Text(
                mNumberList[index].length == 1
                    ? "0${mNumberList[index]}"
                    : mNumberList[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondaryVariant,
                    fontSize: kMediumFontSize14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ));
      },   gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 40,
          childAspectRatio: 3.5 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing:10 ),),
    );
  }
}
