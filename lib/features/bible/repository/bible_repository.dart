import 'dart:developer';

import 'package:bible_app/features/bible/models/bible/book_model.dart';
import 'package:bible_app/features/bible/models/bible/version_model.dart';
import 'package:bible_app/features/bible/service/api.dart';

class BibleRepository {
  late final RestAPI _restAPI;
  BibleRepository({RestAPI? restAPI}) {
    _restAPI = restAPI ?? RestAPI();
  }

// BIBLE VERSIONS
  Future<List<VersionModel>?> getBibleVersions({
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
        // log('Cannot get bible-versions from: $path');
      }
    } catch (e) {
      // log(e.toString());
    }
    return null;
  }

  Future<VersionModel?> getBibleVersion({
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
        // log('Cannot reach path: $path');
      }
    } catch (e) {
      // log(e.toString());
    }
    return null;
  }

// BIBLE BOOKS
    Future<List<BookModel>?> getBibleBooks({
    required RestMethod method,
    required String path,
  }) async {
    try {
      final response = await _restAPI.request(method: method, path: path);
      final data = response.data['data'];
      if (response.statusCode == 200) {
        final result =
            (data as List).map((i) => BookModel.fromJson(i)).toList();
        return result;
      } else {
        // log('Cannot get bible-chapters from: $path');
      }
    } catch (e) {
      // log(e.toString());
    }
    return null;
  }

  Future<BookModel?> getBibleBook({
    required RestMethod method,
    required String path,
  }) async {
    try {
      final response = await _restAPI.request(method: method, path: path);
      final data = response.data.data['data'];
      if (response.statusCode == 200) {
        final result = BookModel.fromJson(data);
        return result;
      } else {
        // log('Cannot reach path: $path');
      }
    } catch (e) {
      // log(e.toString());
    }
    return null;
  }
}