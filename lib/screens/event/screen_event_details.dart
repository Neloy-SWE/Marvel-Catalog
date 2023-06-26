import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/custom_details_page_image_show.dart';
import '../../components/custom_details_tile.dart';
import '../../components/custom_error_dialogue.dart';
import '../../components/custom_loader.dart';
import '../../components/custom_tile_text.dart';
import '../../network/request/provider/provider_event/provider_event_details.dart';
import '../../utilities/all_texts.dart';
import '../../utilities/app_sizes.dart';

class EventDetailsScreen extends ConsumerStatefulWidget {
  final int id;

  const EventDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends ConsumerState<EventDetailsScreen> {
  List<Widget> listCreators = [];
  List<Widget> listCharacters = [];
  List<Widget> listStories = [];
  List<Widget> listComics = [];
  List<Widget> listSeries = [];

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(eventDetailsProvider(widget.id));
    return Scaffold(
      appBar: AppBar(
        title: const Text(AllTexts.details),
      ),
      body: data.when(
        data: (data) {
          for (int i = 0;
              i < data.data!.results![0].creators!.items!.length;
              i++) {
            listCreators.add(
              CustomTileText.show(
                context: context,
                text:
                    "${i + 1}. ${data.data!.results![0].creators!.items![i].name}",
              ),
            );
          }

          for (int i = 0;
              i < data.data!.results![0].characters!.items!.length;
              i++) {
            listCharacters.add(
              CustomTileText.show(
                context: context,
                text:
                    "${i + 1}. ${data.data!.results![0].characters!.items![i].name}",
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

          return ListView(
            padding: const EdgeInsets.all(15),
            children: [
              CustomDetailsPageImage.show(
                imagePath:
                "${data.data!.results![0].thumbnail!.path!}.${data.data!.results![0].thumbnail!.extension!}",
              ),
              AppSizes.gapH10,
              Text(
                data.data!.results![0].title!,
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
                data.data!.results![0].description == null ||
                    data.data!.results![0].description!.isEmpty
                    ? "N/A"
                    : data.data!.results![0].description!,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              AppSizes.gapH30,

              CustomDetailsTile.show(
                  context: context,
                  title: AllTexts.creators,
                  list: listCreators),
              CustomDetailsTile.show(
                  context: context,
                  title: AllTexts.characters,
                  list: listCharacters),
              CustomDetailsTile.show(
                  context: context, title: AllTexts.stories, list: listStories),

              CustomDetailsTile.show(
                  context: context, title: AllTexts.comics, list: listComics),

              CustomDetailsTile.show(
                  context: context, title: AllTexts.series, list: listSeries),

            ],
          );
        },
        error: (err, s) => ErrorDialogue.view(context: context),
        loading: () => const MyLoader(),
      ),
    );
  }
}
