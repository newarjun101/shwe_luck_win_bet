import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_text_form_field.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/loging_screen/widget/buiild_login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return const   Scaffold(
     // backgroundColor: Theme.of(context).primaryColor,

      body: BuildLoginScreenBody()
    );
  }
}
