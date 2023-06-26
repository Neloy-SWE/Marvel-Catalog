import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/model_event/model_event_details.dart';
import '../../api/api_call_event/get_api_event_details.dart';

final eventDetails = Provider<GetEventDetails>((ref) => GetEventDetails());
final eventDetailsProvider =
    FutureProvider.autoDispose.family<EventDetailsModel, int>((ref, id) async {
  return ref.watch(eventDetails).callApi(id: id);
});
