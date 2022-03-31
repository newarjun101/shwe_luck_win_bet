import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/lotery/two_d_betting_controller.dart';

import '../../../core/constants/default_values.dart';

class TowDNumberList extends StatelessWidget {
  final List mNumberList;

  const TowDNumberList({Key? key, required this.mNumberList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultMargin.sh),
      child: GetBuilder<TwoDBettingController>(
        builder: (controller) => controller.mTwoDList.isEmpty
            ? SizedBox(
                height: 30.h,
                width: 30.h,
                child: const CircularProgressIndicator())
            : GridView.builder(
                itemCount: controller.mTwoDList.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                                color: controller.mTwoDList[index].isSelected== true ?Theme.of(context).colorScheme.secondary: Color(0xff0F2810).withOpacity(0.9) ,
                          borderRadius: BorderRadius.circular(0.009.sh),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.8))),
                      padding: EdgeInsets.all(0.001.sh),
                      child: InkWell(
                        splashColor: Theme.of(context).colorScheme.onPrimary,
                        onTap: () => controller.getSelectedIndex(index),
                        child: Center(
                          child: Text(
                            controller.mTwoDList[index].betNumber.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryVariant,
                                fontSize: kSmallFontSize12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ));
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7, crossAxisSpacing: 8, mainAxisSpacing: 8),
              ),
      ),
    );
  }
}
