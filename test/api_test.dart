import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bible_app/features/bible/service/rest_api.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:bible_app/features/bible/models/bible/mocked_data.dart';


void main() {
    apiTest();
}  

void apiTest() async {
  
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  dio.httpClientAdapter = dioAdapter;
  final restAPI = RestAPI(dio: dio);

  test('Get all versions for the bibile.', () async {
   
    const path = 'https://api.scripture.api.bible/v1/bibles';
    final allMockedBibleVersions = jsonEncode(MockedData.allBibleVersions['data']); 

    dioAdapter
        .onGet(
          path,
          (request) => request.reply(200, allMockedBibleVersions),
        );

    final response = await restAPI.request(method: RestMethod.get, path: '');

    expect(response.data, allMockedBibleVersions);

  });

  test('Server not found', () async {
   
    const path = 'https://api.scripture.api.bible/v1/bibles';
    const errorMessage = 'Internal Server Error';

    final dioError = DioError(
      error: {'message': errorMessage},
      requestOptions: RequestOptions(path: path),
      response: Response(
        statusCode: 500,
        requestOptions: RequestOptions(path: path),
      ),
      type: DioErrorType.badResponse,
    );

    dioAdapter
        .onGet(
          path,
          (server) => server.throws(500, dioError),
        );

    expect(() async => await restAPI.request(method: RestMethod.get, path: ''), throwsA(isA<DioError>()));

    // final response = await restAPI.request(method: RestMethod.get, path: '');
    // expect(response, throwsA(isA<DioError>()));

  });



}