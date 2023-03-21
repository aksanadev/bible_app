import 'dart:developer';

import 'package:bible_app/features/bible/models/bible/version_model.dart';
import 'package:bible_app/features/bible/models/bible_model.dart';
import 'package:bible_app/features/bible/service/api.dart';

class BibleRepository {
  late final RestAPI _restAPI;
  BibleRepository({RestAPI? restAPI}) {
    _restAPI = restAPI ?? RestAPI();
  }

  Future<List<VersionModel>?> getAllVersions({
    required RestMethod method,
    required String path,
  }) async {
    try {
      final response = await _restAPI.request(method: method, path: path);
      final data = response.data['data'];
      if (response.statusCode == 200) {
        final result =
            (data as List).map((i) => VersionModel.fromJson(i)).toList();
        return result;
      } else {
        log('Cannot reach path: $path');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<VersionModel?> getVersion({
    required RestMethod method,
    required String path,
  }) async {
    try {
      final response = await _restAPI.request(method: method, path: path);
      final data = response.data.data['data'];
      if (response.statusCode == 200) {
        final result = VersionModel.fromJson(data);
        return result;
      } else {
        log('Cannot reach path: $path');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
