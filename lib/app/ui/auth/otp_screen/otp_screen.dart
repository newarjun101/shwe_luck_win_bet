import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/otp_screen/widget/buiild_otp_screen_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuildOtpScreenBody(),
    );
  }
}
