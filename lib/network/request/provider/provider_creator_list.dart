import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/model_creator_list.dart';
import '../api/get_api_creator_list.dart';

final creatorList = Provider<GetCreatorList>((ref) => GetCreatorList());
final creatorListProvider =
    FutureProvider.autoDispose<CreatorListModel>((ref) async {
  return ref.watch(creatorList).callApi();
});
