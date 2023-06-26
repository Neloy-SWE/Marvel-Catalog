import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/model_creator_details.dart';
import '../api/get_api_creator_details.dart';

final creatorDetails = Provider<GetCreatorDetails>((ref) => GetCreatorDetails());
final creatorDetailsProvider =
FutureProvider.autoDispose.family<CreatorDetailsModel, int>((ref, id) async {
  return ref.watch(creatorDetails).callApi(id: id);
});
