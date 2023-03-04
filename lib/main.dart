import 'package:flutter/material.dart';
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
        title: AllTexts.appTitle,
        home: Container(),
      ),
    );
  }
}
