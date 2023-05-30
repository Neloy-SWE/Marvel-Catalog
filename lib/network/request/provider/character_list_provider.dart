import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marvel_catalog/network/model/model_character_list.dart';
import 'package:marvel_catalog/network/request/api/get_api_category_list.dart';

final characterList = Provider<GetCharacterList>((ref)=>GetCharacterList());
final characterListProvider = FutureProvider<CharacterListModel>((ref) async {
  return ref.watch(characterList).callApi();
});

