import 'package:flutter/material.dart';
import '../utilities/image_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late final AnimationController rotationController =
  AnimationController(vsync: this, duration: const Duration(seconds: 4))
    ..repeat();

  @override
  dispose() {
    rotationController.dispose();
    super.dispose();
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
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.dstATop),
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
              Image.asset(
                ImagePath.logo,
                height: 100,

              ),
              RotationTransition(
                turns:
                Tween(begin: 0.0, end: 1.0).animate(rotationController),
                child: Image.asset(
                  ImagePath.loader,
                  width: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
