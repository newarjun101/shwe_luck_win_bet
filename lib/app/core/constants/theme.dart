import 'package:flutter/material.dart';

import 'default_values.dart';


class StyleTheme {
  ThemeData getTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: secondary,
        secondaryVariant: secondaryVariant,
        onSecondary: onSecondary,
        primaryVariant: primaryVariant, ///card bg color
        onPrimary: onPrimary,
        ///text  color
      ),

    );
  }
}