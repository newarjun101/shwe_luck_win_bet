import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/off_day_screen/widget/off_day_list.dart';

class BuildOffDayScreenBody extends StatelessWidget {
  const BuildOffDayScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          height: double.infinity,

          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: const AssetImage('assets/images/bg.png',),
                  colorFilter: ColorFilter.mode(Theme.of(context).primaryColor.withOpacity(0.27),  BlendMode.modulate)
              )
          ),
        ),
       const  Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: OffDayList())
      ],
    );
  }
}
