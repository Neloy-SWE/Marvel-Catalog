import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marvel_catalog/components/custom_loader.dart';
import 'package:marvel_catalog/screens/screen_home_page.dart';
import 'package:marvel_catalog/utilities/all_texts.dart';
import 'package:marvel_catalog/utilities/app_sizes.dart';
import '../utilities/image_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (builder) => const HomePage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.35), BlendMode.dstATop),
            image: const AssetImage(
              ImagePath.cap,
            ),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // logo
              Image.asset(
                ImagePath.logo,
                height: 100,
              ),

              // loader & copyright text
              Column(
                children: [
                  const MyLoader(),
                  AppSizes.gapH30,

                  // copyright text
                  Text(
                    AllTexts.copyRight,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
