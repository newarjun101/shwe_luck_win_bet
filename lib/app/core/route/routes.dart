import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/module/binding/feature_main_binding.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/loging_screen/login_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/otp_screen/otp_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/sign_up_screen/sign_up_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/balance_page/balance_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/today_result/today_result.dart';

import '../../ui/feature_main/feature_main.dart';

class Routes {
  var routerPage = [
    GetPage(
        name: Pages.lINITIAL,
        page: () => const FeatureMain(),
        binding: FeatureMainBinding()),
    GetPage(
        name: Pages.lTodayResult,
        page: () => const TodayResult(),
  binding: FeatureMainBinding(),
       ),
    GetPage(
      name: Pages.lBalancePage,
      page: () => const BalanceScreen(),

    ),
    GetPage(
      name: Pages.lLoginScreen,
      page: () => const LoginScreen(),

    ),
    GetPage(
      name: Pages.lSignUp,
      page: () => const SignUpScreen(),

    ),
    GetPage(
      name: Pages.lOtp,
      page: () => const OtpScreen(),

    ),

  ];
}
