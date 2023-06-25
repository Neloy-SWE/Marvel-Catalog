import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/model_comic_details.dart';
import '../api/get_api_comic_details.dart';

final comicDetails = Provider<GetComicDetails>((ref) => GetComicDetails());
final comicDetailsProvider =
    FutureProvider.autoDispose.family<ComicDetailsModel, int>((ref, id) async {
  return ref.watch(comicDetails).callApi(id: id);
});
