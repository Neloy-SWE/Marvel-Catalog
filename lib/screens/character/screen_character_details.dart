import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marvel_catalog/components/custom_details_page_image_show.dart';
import 'package:marvel_catalog/components/custom_details_tile.dart';
import 'package:marvel_catalog/components/custom_tile_text.dart';
import 'package:marvel_catalog/components/custom_tile_text.dart';
import 'package:marvel_catalog/components/custom_tile_text.dart';
import 'package:marvel_catalog/components/custom_tile_text.dart';
import 'package:marvel_catalog/utilities/all_colors.dart';
import 'package:marvel_catalog/utilities/all_texts.dart';
import 'package:marvel_catalog/utilities/app_sizes.dart';

import '../../components/custom_error_dialogue.dart';
import '../../components/custom_loader.dart';
import '../../network/request/provider/provider_character/provider_character_details.dart';

class CharacterDetailsScreen extends ConsumerStatefulWidget {
  final int id;

  const CharacterDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<CharacterDetailsScreen> createState() =>
      _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState
    extends ConsumerState<CharacterDetailsScreen> {
  List<Widget> listComics = [];
  List<Widget> listSeries = [];
  List<Widget> listStories = [];
  List<Widget> listEvents = [];

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(characterDetailsProvider(widget.id));
    return Scaffold(
      appBar: AppBar(
        title: const Text(AllTexts.details),
      ),
      body: data.when(
        data: (data) {
          for (int i = 0;
              i < data.data!.results![0].comics!.items!.length;
              i++) {
            listComics.add(
              CustomTileText.show(
                context: context,
                text:
                    "${i + 1}. ${data.data!.results![0].comics!.items![i].name}",
              ),
            );
          }

          for (int i = 0;
              i < data.data!.results![0].series!.items!.length;
              i++) {
            listSeries.add(
              CustomTileText.show(
                context: context,
                text:
                    "${i + 1}. ${data.data!.results![0].series!.items![i].name}",
              ),
            );
          }

          for (int i = 0;
              i < data.data!.results![0].stories!.items!.length;
              i++) {
            listStories.add(
              CustomTileText.show(
                context: context,
                text:
                    "${i + 1}. ${data.data!.results![0].stories!.items![i].name}",
              ),
            );
          }

          for (int i = 0;
              i < data.data!.results![0].events!.items!.length;
              i++) {
            listEvents.add(
              CustomTileText.show(
                context: context,
                text:
                    "${i + 1}. ${data.data!.results![0].events!.items![i].name}",
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(15),
            children: [
              CustomDetailsPageImage.show(
                imagePath:
                    "${data.data!.results![0].thumbnail!.path!}.${data.data!.results![0].thumbnail!.extension!}",
              ),
              AppSizes.gapH10,
              Text(
                data.data!.results![0].name!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              AppSizes.gapH30,
              Text(
                "${AllTexts.description}:",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontFamily: AllTexts.boldFont),
              ),
              AppSizes.gapH05,
              Text(
                data.data!.results![0].description!.isEmpty
                    ? "N/A"
                    : data.data!.results![0].description!,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              AppSizes.gapH30,
              CustomDetailsTile.show(
                  context: context, title: AllTexts.comics, list: listComics),
              CustomDetailsTile.show(
                  context: context, title: AllTexts.series, list: listSeries),
              CustomDetailsTile.show(
                  context: context, title: AllTexts.stories, list: listStories),
              CustomDetailsTile.show(
                  context: context, title: AllTexts.events, list: listEvents),
            ],
          );
        },
        error: (err, s) => ErrorDialogue.view(context: context),
        loading: () => const MyLoader(),
      ),
    );
  }
}
