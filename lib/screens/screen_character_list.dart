import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marvel_catalog/components/custom_loader.dart';
import 'package:marvel_catalog/network/model/model_character_list.dart';
import 'package:marvel_catalog/utilities/all_texts.dart';
import 'package:marvel_catalog/utilities/app_sizes.dart';
import '../components/custom_error_dialogue.dart';
import '../components/custom_list_container.dart';
import '../components/grid_view_fixed_height.dart';
import '../network/request/provider/provider_character_list.dart';
import '../utilities/all_colors.dart';
import '../utilities/image_path.dart';

class CharacterList extends ConsumerStatefulWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  ConsumerState<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends ConsumerState<CharacterList> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(characterListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AllTexts.allCharacters),
      ),
      body: CustomListContainer.get(
        context: context,
        backgroundImagePath: ImagePath.characterListBack,
        child: data.when(
          data: (data) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const GridViewFixedHeight(
                crossAxisCount: 2,
                // childAspectRatio: 0.60,
                height: 210,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: data.data!.results!.length,
              itemBuilder: (context, index) {
                return _characterCard(value: data, index: index);
              },
            );
          },
          error: (err, s) => ErrorDialogue.view(context: context),
          loading: () => const MyLoader(),
        ),
      ),
    );
  }

  Widget _characterCard(
      {required CharacterListModel value, required int index}) {
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
                color: AllColors.primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    15,
                  ),
                  topRight: Radius.circular(
                    15,
                  ),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        '${value.data!.results![index].thumbnail!.path!}.${value.data!.results![index].thumbnail!.extension!}'),
                    fit: BoxFit.fill)),
          ),
          AppSizes.gapH10,

          // name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              value.data!.results![index].name!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
