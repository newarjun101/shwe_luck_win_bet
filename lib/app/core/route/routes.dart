import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/module/binding/feature_main_binding.dart';
import 'package:shwe_luck_win_bet/app/module/controller/feature_main_controller.dart';

import '../../ui/feature_main/feature_main.dart';

class Routes {
  var routerPage = [
    GetPage(
        name: Pages.lFeatureMian,
        page: () => const FeatureMain(),
        binding: FeatureMainBinding())
  ];
}
