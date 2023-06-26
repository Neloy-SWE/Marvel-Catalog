import 'dart:convert';

import '../../../constant/api_value.dart';
import '../../../constant/keys.dart';
import '../../../model/model_creator/model_creator_list.dart';
import 'package:http/http.dart' as http;

class GetCreatorList {
  Future<CreatorListModel> callApi() async {
    var request = http.Request(
        ApiValue.get,
        Uri.parse(
            "${ApiValue.baseUrl}${ApiValue.creators}${ApiValue.limit}${MyKeys.call}"));
    http.StreamedResponse response = await request.send();
    var str = await response.stream.bytesToString();
    var data = jsonDecode(str);
    if (data[ApiValue.code] == ApiValue.getSuccessCode) {
      return CreatorListModel.fromJson(str);
    }
    throw Exception(ApiValue.exceptionMessage);
  }
}
