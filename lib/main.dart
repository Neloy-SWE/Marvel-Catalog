import 'package:flutter/material.dart';
import 'package:marvel_catalog/components/my_theme.dart';
import 'package:marvel_catalog/screens/screen_splash.dart';
import 'package:marvel_catalog/utilities/all_texts.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.myTheme,
        title: AllTexts.appTitle,
        home: const SplashScreen(),
      ),
    );
  }
}
