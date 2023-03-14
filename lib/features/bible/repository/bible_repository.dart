import 'dart:developer';

import 'package:bible_app/features/bible/models/bible_model.dart';
import 'package:bible_app/features/bible/service/api.dart';

class BibleRepository {
  late final RestAPI _restAPI;
  BibleRepository({RestAPI? restAPI}) {
    _restAPI = restAPI ?? RestAPI();
  }

  // Future<List<BibleModel>?> getAllBibles({
  //   required RestMethod method,
  //   required String path,
  // }) async {
  //   final response = await _restAPI.request(method: method, path: path);
  //   if (response.statusCode == 200) {
  //     final data = response.data['data'];
  //     final result = (data as List).map((i) => BibleModel.fromJson(i)).toList();
  //     return result;
  //   } else {
  //     log('cannot rearch data');
  //   }
  // }

    Future<List<BibleModel>?> getAllBibles({
    required RestMethod method,
    required String path,
  }) async {
    try {
      final response = await _restAPI.request(method: method, path: path);
      final data = response.data['data'];
      if (response.statusCode == 200) {
        final result =
            (data as List).map((i) => BibleModel.fromJson(i)).toList();
        return result;
      } else {
        log('Cannot reach path: $path');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
