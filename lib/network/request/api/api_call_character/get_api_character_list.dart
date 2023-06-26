import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel_catalog/network/constant/api_value.dart';
import 'package:marvel_catalog/network/constant/keys.dart';
import 'package:marvel_catalog/network/model/model_character/model_character_list.dart';

class GetCharacterList {
  Future<CharacterListModel> callApi() async {
    var request = http.Request(
        ApiValue.get,
        Uri.parse(
            "${ApiValue.baseUrl}${ApiValue.characters}${ApiValue.limit}${MyKeys.call}"));
    http.StreamedResponse response = await request.send();
    var str = await response.stream.bytesToString();
    var data = jsonDecode(str);
    if (data[ApiValue.code] == ApiValue.getSuccessCode) {
      return CharacterListModel.fromJson(str);
    }
    throw Exception(ApiValue.exceptionMessage);
  }
}
