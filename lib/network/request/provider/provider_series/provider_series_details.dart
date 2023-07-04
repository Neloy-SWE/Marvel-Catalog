import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/model_series/model_series_details.dart';
import '../../api/api_call_series/get_api_series_details.dart';

final seriesDetails = Provider<GetSeriesDetails>((ref) => GetSeriesDetails());
final seriesDetailsProvider =
    FutureProvider.autoDispose.family<SeriesDetailsModel, int>((ref, id) async {
  return ref.watch(seriesDetails).callApi(id: id);
});
