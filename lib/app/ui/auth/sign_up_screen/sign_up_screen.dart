import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/sign_up_screen/widget/buiild_sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: BuildSignUpScreenBody(),
    );
  }
}
