import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel_catalog/network/constant/api_value.dart';

import '../../../constant/keys.dart';
import '../../../model/model_comic/model_comic_details.dart';

class GetComicDetails {
  Future<ComicDetailsModel> callApi({required int id}) async {
    var request = http.Request(ApiValue.get,
        Uri.parse("${ApiValue.baseUrl}${ApiValue.comics}/$id?${MyKeys.call}"));
    http.StreamedResponse response = await request.send();
    var str = await response.stream.bytesToString();
    var data = jsonDecode(str);
    if (data[ApiValue.code] == ApiValue.getSuccessCode) {
      return ComicDetailsModel.fromJson(str);
    }
    throw Exception(ApiValue.exceptionMessage);
  }
}
