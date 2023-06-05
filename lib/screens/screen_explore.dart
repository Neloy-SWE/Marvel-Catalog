import 'package:flutter/material.dart';
import 'package:marvel_catalog/screens/screen_character_list.dart';
import 'package:marvel_catalog/utilities/all_texts.dart';
import 'package:marvel_catalog/utilities/app_sizes.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Option> option = [
    Option("Characters", "assets/images/character.jpg"),
    Option("Comics", "assets/images/comic.jpg"),
    Option("Creators", "assets/images/creator.jpg"),
    Option("Events", "assets/images/event.jpg"),
    Option("Series", "assets/images/series.jpg"),
    Option("Stories", "assets/images/stories.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    List navigateScreens = [
    navigateCharacterScreen,
    navigateCharacterScreen,
    navigateCharacterScreen,
    navigateCharacterScreen,
    navigateCharacterScreen,
    navigateCharacterScreen,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(AllTexts.explore),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        shrinkWrap: true,
        itemCount: option.length,
        itemBuilder: (context, index) {
          return _myContainer(
              option: option[index], onTap: navigateScreens[index]);
        },
      ),
    );
  }

  navigateCharacterScreen(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => const CharacterList(),
      ),
    );
  }

  Widget _myContainer({required Option option, required Function onTap}) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            onTap();
          },
          child: Container(
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  15,
                ),
              ),
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.65), BlendMode.colorBurn),
                  image: AssetImage(option.imagePath),
                  fit: BoxFit.fill),
            ),
            child: Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Text(
                option.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ),
        ),
        AppSizes.gapH20,
      ],
    );
  }
}

class Option {
  String name;
  String imagePath;

  Option(this.name, this.imagePath);
}
