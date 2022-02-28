import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/ui/profile_page/all_widget/build_setting_list.dart';
import 'package:shwe_luck_win_bet/app/ui/profile_page/all_widget/profile_widget.dart';

class BuildProfileMainBody extends StatelessWidget {
  const BuildProfileMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProfileWidget(),
        Expanded(child: BuildSettingList())
      ],
    );
  }
}
