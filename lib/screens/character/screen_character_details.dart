import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marvel_catalog/utilities/all_colors.dart';
import 'package:marvel_catalog/utilities/all_texts.dart';
import 'package:marvel_catalog/utilities/app_sizes.dart';

import '../../components/custom_error_dialogue.dart';
import '../../components/custom_loader.dart';
import '../../network/request/provider/provider_character_details.dart';

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
    for (int i = 0; i <= 4; i++) {}
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
              _listText(
                text:
                    "${i + 1}. ${data.data!.results![0].comics!.items![i].name}",
              ),
            );
          }

          for (int i = 0;
              i < data.data!.results![0].series!.items!.length;
              i++) {
            listSeries.add(
              _listText(
                text:
                    "${i + 1}. ${data.data!.results![0].series!.items![i].name}",
              ),
            );
          }

          for (int i = 0;
              i < data.data!.results![0].stories!.items!.length;
              i++) {
            listStories.add(
              _listText(
                text:
                    "${i + 1}. ${data.data!.results![0].stories!.items![i].name}",
              ),
            );
          }

          for (int i = 0;
              i < data.data!.results![0].events!.items!.length;
              i++) {
            listEvents.add(
              _listText(
                text:
                    "${i + 1}. ${data.data!.results![0].events!.items![i].name}",
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(15),
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      "${data.data!.results![0].thumbnail!.path!}.${data.data!.results![0].thumbnail!.extension!}",
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
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
              _myTile(title: AllTexts.comics, list: listComics),
              _myTile(title: AllTexts.series, list: listSeries),
              _myTile(title: AllTexts.stories, list: listStories),
              _myTile(title: AllTexts.events, list: listEvents),
            ],
          );
        },
        error: (err, s) => ErrorDialogue.view(context: context),
        loading: () => const MyLoader(),
      ),
    );
  }

  Widget _myTile({required String title, required List<Widget> list}) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(title),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: AllColors.primaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          children: list.isEmpty ? [_listText(text: "N/A")] : list,
        ),
        AppSizes.gapH10,
      ],
    );
  }

  Widget _listText({required String text}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
