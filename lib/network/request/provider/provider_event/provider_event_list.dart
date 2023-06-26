import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/model_event/model_event_list.dart';
import '../../api/api_call_event/get_api_event_list.dart';

final eventList = Provider<GetEventList>((ref) => GetEventList());
final eventListProvider =
    FutureProvider.autoDispose<EventListModel>((ref) async {
  return ref.watch(eventList).callApi();
});
