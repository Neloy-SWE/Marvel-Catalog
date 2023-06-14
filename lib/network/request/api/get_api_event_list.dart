import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel_catalog/network/constant/api_value.dart';
import 'package:marvel_catalog/network/constant/keys.dart';

import '../../model/model_event_list.dart';

class GetEventList {
  Future<EventListModel> callApi() async {
    var request = http.Request(
        ApiValue.get,
        Uri.parse(
            "${ApiValue.baseUrl}${ApiValue.events}${ApiValue.limit}${MyKeys.call}"));
    http.StreamedResponse response = await request.send();
    var str = await response.stream.bytesToString();
    var data = jsonDecode(str);
    if (data[ApiValue.code] == ApiValue.getSuccessCode) {
      return EventListModel.fromJson(str);
    }
    throw Exception(ApiValue.exceptionMessage);
  }
}
