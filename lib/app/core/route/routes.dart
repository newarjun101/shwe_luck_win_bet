import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/module/binding/betting_page_binding.dart';
import 'package:shwe_luck_win_bet/app/module/binding/cash_in_cash_out_screen_binding.dart';
import 'package:shwe_luck_win_bet/app/module/binding/edit_profile_screen_binding.dart';
import 'package:shwe_luck_win_bet/app/module/binding/feature_main_binding.dart';
import 'package:shwe_luck_win_bet/app/module/binding/login_screen_binding.dart';
import 'package:shwe_luck_win_bet/app/module/binding/sign_up_screen_binding.dart';
import 'package:shwe_luck_win_bet/app/module/binding/two_d_binding.dart';
import 'package:shwe_luck_win_bet/app/testing_app/binding/test_local_binding.dart';
import 'package:shwe_luck_win_bet/app/testing_app/test_localization.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/account_success_screen/account_success_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/change_password_screen/change_password_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/loging_screen/login_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/otp_screen/otp_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/sign_up_screen/sign_up_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/balance_page/balance_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/bet_selected_screen/bet_selected_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/betting_page/betting_page.dart';
import 'package:shwe_luck_win_bet/app/ui/cash_in_screen/cash_in_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/cash_out_screen/cash_out_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/off_day_screen/off_day_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/three_d_betting_screen/three_d_betting_page.dart';
import 'package:shwe_luck_win_bet/app/ui/today_result/today_result.dart';
import 'package:shwe_luck_win_bet/app/ui/update_profile_screen/edit_profile_screen.dart';
import '../../module/binding/three_d_binding.dart';
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
        binding: LoginScreenBinding()),
    GetPage(
        name: Pages.lSignUp,
        page: () => const SignUpScreen(),
        binding: SignUpScreenBinding()),
    GetPage(
      name: Pages.lOtp,
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: Pages.lAccountSuccess,
      page: () => const AccountSuccessScreen(),
    ),
    GetPage(
      name: Pages.lOffDay,
      page: () => const OffDayScreen(),
    ),
    GetPage(
      name: Pages.lBetSelected,
      page: () => const BetSelectedScreen(),
    ),
    GetPage(
        name: Pages.lTestLocal,
        page: () => HomePage(),
        binding: TestLocalBinding()),
    GetPage(
        name: Pages.lBetting,
        page: () => const BettingPage(),
        binding: TwoDBinding()),
    GetPage(
        name: Pages.lThreeDBetting,
        page: () => const ThreeDBettingPage(),
        binding: ThreeDBinding()),

    GetPage(name: Pages.lEditProfile, page: ()=> const EditProfileScreen(),
    binding: EditProfileScreenBinding()),
    GetPage(
        name: Pages.lChangePassword,
        page: () => const ChangePasswordScreen(),
        binding: SignUpScreenBinding()),
    GetPage(
        name: Pages.lCashOut,
        page: () => const CashOutScreen(),
        binding: CashInCashOutScreenBinding()),
    GetPage(
        name: Pages.lCashIn,
        page: () => const CashInScreen(),
        binding: CashInCashOutScreenBinding()),

  ];
}
