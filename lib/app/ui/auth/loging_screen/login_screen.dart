import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:const [
          CustomTextFormField()
        ],
      ),
    );
  }
}
