import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel_catalog/network/constant/api_value.dart';

import '../../../constant/keys.dart';
import '../../../model/model_series/model_series_details.dart';

class GetSeriesDetails {
  Future<SeriesDetailsModel> callApi({required int id}) async {
    var request = http.Request(ApiValue.get,
        Uri.parse("${ApiValue.baseUrl}${ApiValue.series}/$id?${MyKeys.call}"));
    http.StreamedResponse response = await request.send();
    var str = await response.stream.bytesToString();
    var data = jsonDecode(str);
    if (data[ApiValue.code] == ApiValue.getSuccessCode) {
      return SeriesDetailsModel.fromJson(str);
    }
    throw Exception(ApiValue.exceptionMessage);
  }
}
