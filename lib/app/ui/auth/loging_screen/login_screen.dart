import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/loging_screen/widget/buiild_login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,

        body: BuildLoginScreenBody());
  }
}
