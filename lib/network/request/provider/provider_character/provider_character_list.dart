import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/model_character/model_character_list.dart';
import '../../api/api_call_character/get_api_character_list.dart';

final characterList = Provider<GetCharacterList>((ref) => GetCharacterList());
final characterListProvider = FutureProvider.autoDispose<CharacterListModel>((ref) async {
  return ref.watch(characterList).callApi();
});
