import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/model_series_list.dart';
import '../api/get_api_series_list.dart';

final seriesList = Provider<GetSeriesList>((ref) => GetSeriesList());
final seriesListProvider =
    FutureProvider.autoDispose<SeriesListModel>((ref) async {
  return ref.watch(seriesList).callApi();
});
