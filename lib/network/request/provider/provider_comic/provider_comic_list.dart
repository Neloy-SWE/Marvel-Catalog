import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/model_comic/model_comic_list.dart';
import '../../api/api_call_comic/get_api_comic_list.dart';

final comicList = Provider<GetComicList>((ref) => GetComicList());
final comicListProvider =
    FutureProvider.autoDispose<ComicListModel>((ref) async {
  return ref.watch(comicList).callApi();
});
