import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/update_profile_screen/widget/build_profile_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
      body: const BuildEditProfileScreenBody()
    );
  }
}