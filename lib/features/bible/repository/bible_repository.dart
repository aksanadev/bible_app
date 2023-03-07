import 'package:bible_app/features/bible/models/bible_model.dart';
import 'package:bible_app/features/bible/service/api.dart';

class BibleRepository {
  late final RestAPI _restAPI;
  BibleRepository({RestAPI? restAPI}) {
    _restAPI = restAPI ?? RestAPI();
  }

  Future<List<BibleModel>> getAllBibles({
    required RestMethod method,
    required String path,
  }) async {
    final response = await _restAPI.request(method: method, path: path);
    final data = response.data['data'];
    final result = (data as List).map((i) => BibleModel.fromJson(i)).toList();
    return result;
  }
}
