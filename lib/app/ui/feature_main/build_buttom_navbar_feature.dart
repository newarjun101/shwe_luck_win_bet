import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

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
            Icons.home_outlined, 'Home', context, 0, featureMainController),
        getNavigationBarItem(Icons.account_balance_wallet, 'Balance', context,
            0, featureMainController),
        getNavigationBarItem(Icons.phone_callback_outlined, 'Help', context, 0,
            featureMainController),
        getNavigationBarItem(
            Icons.account_circle, 'Profile', context, 0, featureMainController),
      ],
      elevation: 1,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: Theme.of(context).colorScheme.primaryVariant,
      showUnselectedLabels: true,
      backgroundColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: featureMainController.getIndex(),
      selectedFontSize: 14,
      unselectedFontSize: 14,
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
