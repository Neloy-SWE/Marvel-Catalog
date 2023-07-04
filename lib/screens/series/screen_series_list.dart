import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marvel_catalog/screens/series/screen_series_details.dart';

import '../../components/custom_error_dialogue.dart';
import '../../components/custom_list_container.dart';
import '../../components/custom_loader.dart';
import '../../components/grid_view_fixed_height.dart';
import '../../network/model/model_series/model_series_list.dart';
import '../../network/request/provider/provider_series/provider_series_list.dart';
import '../../utilities/all_colors.dart';
import '../../utilities/all_texts.dart';
import '../../utilities/app_sizes.dart';
import '../../utilities/image_path.dart';

class SeriesList extends ConsumerStatefulWidget {
  const SeriesList({Key? key}) : super(key: key);

  @override
  ConsumerState<SeriesList> createState() => _SeriesListState();
}

class _SeriesListState extends ConsumerState<SeriesList> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(seriesListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AllTexts.allSeries),
      ),
      body: CustomListContainer.get(
        context: context,
        backgroundImagePath: ImagePath.seriesListBack,
        child: data.when(
          data: (data) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const GridViewFixedHeight(
                crossAxisCount: 2,
                height: 210,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: data.data!.results!.length,
              itemBuilder: (context, index) {
                return _creatorCard(value: data, index: index);
              },
            );
          },
          error: (err, s) => ErrorDialogue.view(context: context),
          loading: () => const MyLoader(),
        ),
      ),
    );
  }

  Widget _creatorCard({required SeriesListModel value, required int index}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (builder) =>
                SeriesDetailsScreen(id: value.data!.results![index].id!),
          ),
        );
      },
      child: Container(
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
                value.data!.results![index].title!,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
