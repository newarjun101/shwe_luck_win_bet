import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';

import '../../module/controller/feature_main_controller.dart';

class BuildButtomNavbarFeature extends StatelessWidget {
  final FeatureMainController featureMainController;

  const BuildButtomNavbarFeature(
      {Key? key, required this.featureMainController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        getNavigationBarItem(
            Icons.home_outlined, 'ပင်မစာမျက်နှာ', context, 0, featureMainController),
        getNavigationBarItem(Icons.account_balance_wallet, 'ပိုက်ဆံအိတ်', context,
            0, featureMainController),
        getNavigationBarItem(Icons.phone_callback_outlined, 'အကူအညီ', context, 0,
            featureMainController),
        getNavigationBarItem(
            Icons.account_circle, 'ပရိုဖိုင်', context, 0, featureMainController),
      ],
      elevation: 1,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: Theme.of(context).colorScheme.primaryContainer,
      showUnselectedLabels: true,
      backgroundColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: featureMainController.getIndex(),
      selectedFontSize: kSmallFontSize12,
      iconSize: kExtraBigLargeFontSize24,
      unselectedFontSize: kSmallFontSize12,
      onTap: (index) {
        print("index");
        featureMainController.changeIndex(index);
      },
    );
  }
}

BottomNavigationBarItem getNavigationBarItem(
    iconName, label, context, index, FeatureMainController mController) {
  return BottomNavigationBarItem(
    icon: Icon(iconName),
    label: label,

  );
}
