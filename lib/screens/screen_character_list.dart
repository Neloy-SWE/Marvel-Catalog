import 'package:flutter/material.dart';
import 'package:marvel_catalog/utilities/all_texts.dart';
import 'package:marvel_catalog/utilities/app_sizes.dart';

import '../components/grid_view_fixed_height.dart';
import '../utilities/all_colors.dart';
import '../utilities/image_path.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AllTexts.allCharacters),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.35), BlendMode.dstATop),
            image: const AssetImage(
              ImagePath.characterListBack,
            ),
          ),
        ),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const GridViewFixedHeight(
            crossAxisCount: 2,
            // childAspectRatio: 0.60,
            height: 210,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return _characterCard();
          },
        ),
      ),
    );
  }

  Widget _characterCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.70),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            15,
          ),
        ),
        border: Border.all(
          color: AllColors.primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // iamge
          Container(
            height: 155,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    15,
                  ),
                  topRight: Radius.circular(
                    15,
                  ),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg"),
                    fit: BoxFit.fill)),
          ),
          AppSizes.gapH10,


          // name
          Text(
            "Hello",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
