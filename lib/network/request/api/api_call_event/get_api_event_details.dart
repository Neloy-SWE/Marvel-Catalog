import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel_catalog/network/constant/api_value.dart';

import '../../../constant/keys.dart';
import '../../../model/model_event/model_event_details.dart';

class GetEventDetails {
  Future<EventDetailsModel> callApi({required int id}) async {
    var request = http.Request(ApiValue.get,
        Uri.parse("${ApiValue.baseUrl}${ApiValue.events}/$id?${MyKeys.call}"));
    http.StreamedResponse response = await request.send();
    var str = await response.stream.bytesToString();
    var data = jsonDecode(str);
    if (data[ApiValue.code] == ApiValue.getSuccessCode) {
      return EventDetailsModel.fromJson(str);
    }
    throw Exception(ApiValue.exceptionMessage);
  }
}
