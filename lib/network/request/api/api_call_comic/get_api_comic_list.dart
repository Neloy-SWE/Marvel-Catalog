import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel_catalog/network/model/model_comic/model_comic_list.dart';

import '../../../constant/api_value.dart';
import '../../../constant/keys.dart';

class GetComicList {
  Future<ComicListModel> callApi() async {
    var request = http.Request(
        ApiValue.get,
        Uri.parse(
            "${ApiValue.baseUrl}${ApiValue.comics}${ApiValue.limit}${MyKeys.call}"));
    http.StreamedResponse response = await request.send();
    var str = await response.stream.bytesToString();
    var data = jsonDecode(str);
    if (data[ApiValue.code] == ApiValue.getSuccessCode) {
      return ComicListModel.fromJson(str);
    }
    throw Exception(ApiValue.exceptionMessage);
  }
}
