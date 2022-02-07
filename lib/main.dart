import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/core/route/routes.dart';
import 'app/core/constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Whole Snack',
      // builder: DevicePreview.appBuilder,
      theme: StyleTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      getPages: Routes().routerPage,
      initialRoute: Pages.lFeatureMian,
    );
  }
}
