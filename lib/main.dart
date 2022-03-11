import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/core/route/routes.dart';
import 'package:shwe_luck_win_bet/app/testing_app/controller/test_local_controller.dart';
import 'app/core/constants/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

import 'app/testing_app/local_string.dart';

void main() async {

  await GetStorage.init();
  runApp(const MyApp());
/*  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ));*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TestLocalController());
    return ScreenUtilInit(builder: () {
      return GetMaterialApp(
        title: 'Whole Snack',
        builder: (context, widget) {
          //add this line
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        // builder: DevicePreview.appBuilder,
        theme: StyleTheme().getTheme(),
        debugShowCheckedModeBanner: false,
          translations: LocaleString(),
          locale: controller.addToLocale(),
          fallbackLocale: Locale(
            'en',
            'US',
          ),
          getPages: Routes().routerPage,
        initialRoute: Pages.lTestLocal
      );
    });
  }
}
