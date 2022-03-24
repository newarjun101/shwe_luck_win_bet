import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/change_password_screen/widget/buiild_change_password_screen_body.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/sign_up_screen/widget/buiild_sign_up_screen_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: BuildChangePasswordBody(),
    );
  }
}
