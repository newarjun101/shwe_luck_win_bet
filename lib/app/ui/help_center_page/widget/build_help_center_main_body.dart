import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/help_center_page/widget/build_help_list.dart';

class BuildHelpCenerBody extends StatelessWidget {
  const BuildHelpCenerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: const AssetImage('assets/images/bg.png',),
                  colorFilter: ColorFilter.mode(Theme.of(context).primaryColor.withOpacity(0.27),  BlendMode.modulate)
              )
          ),
        ),
        const BuildHelpList(),
      ],
    );
  }
}
