import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marvel_catalog/network/model/model_character/model_character_details.dart';
import 'package:marvel_catalog/network/request/api/api_call_character/get_api_character_details.dart';

final characterDetails = Provider<GetCharacterDetails>((ref) => GetCharacterDetails());
final characterDetailsProvider = FutureProvider.autoDispose.family<CharacterDetailsModel, int>((ref, id) async{
  return ref.watch(characterDetails).callApi(id: id);
});