import 'package:dio/dio.dart';

class RestAPI {
  final String baseUrl;
  final String api_key;
  final Dio _dio;

  RestAPI({
    this.baseUrl = 'https://api.scripture.api.bible/v1/bibles',
    this.api_key = 'ca215608bd0932213412999f3acbdd87',
  }) : _dio = Dio();

  Future<Response> request({
    required RestMethod method,
    required String path,
  }) async {
    late Response response;
    switch (method) {
      case RestMethod.get:
        _dio.options.headers['api-key'] = api_key;
        response = await _dio.get(baseUrl + path);
        break;
      case RestMethod.post:
        break;
      case RestMethod.put:
        break;
      case RestMethod.delete:
        break;
      case RestMethod.patch:
        break;
    }
    return response;
  }
}

enum RestMethod {
  get,
  post,
  put,
  delete,
  patch,
}
