import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/account_success_screen/widget/buiild_account_success_screen_body.dart';

class AccountSuccessScreen extends StatelessWidget {
  const AccountSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuildAccountSuccessScreenBody(),
    );
  }
}
