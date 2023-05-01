import 'package:flutter/material.dart';
import 'package:marvel_catalog/components/custom_buttons.dart';
import 'package:marvel_catalog/screens/screen_character_list.dart';
import 'package:marvel_catalog/utilities/all_texts.dart';
import 'package:marvel_catalog/utilities/app_sizes.dart';
import 'package:marvel_catalog/utilities/image_path.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AllTexts.welcome,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(
          15,
        ),
        shrinkWrap: true,
        children: [
          Image.asset(ImagePath.marvel),
          AppSizes.gapH30,
          Text(
            AllTexts.wantToKnow,
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          Text(
            AllTexts.aboutYourFavCharacter,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          AppSizes.gapH80,
          AllButtons.btnGeneral(
              context: context,
              btnText: AllTexts.explore,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => const CharacterList(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
