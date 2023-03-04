import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_catalog/utilities/all_colors.dart';
import 'package:marvel_catalog/utilities/all_texts.dart';

class MyTheme{
  static final myTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AllColors.primaryColor),
      centerTitle: true,
      elevation: 0,
      color: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        fontFamily: AllTexts.boldFont,
        color: AllColors.primaryColor,
        fontSize: 35,
      ),
    ),
  );
}