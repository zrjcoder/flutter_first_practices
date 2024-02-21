export 'movie/movie_repository.dart';
export 'movie/popular_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter_application_hello/src/common/common.dart';

abstract class BaseRepository<T> {
  final Dio httpClient;

  const BaseRepository(this.httpClient);

  Future<T> getData(String url) async {
    return _makeRequest<T>(() => httpClient.get(url));
  }

  Future<T> postData(String url, dynamic data) async {
    return _makeRequest<T>(() => httpClient.post(url, data: data));
  }

  // 可以添加更多方法，例如 putData, deleteData 等
  Future<T> _makeRequest<T>(Future<Response> Function() requestMethod) async {
    try {
      final response = await requestMethod();
      final data = response.data as T;
      return {'data': data, 'failure': null} as T;
    } on DioException catch (error) {
      return {'data': null, 'failure': _handleError(error)} as T;
    }
  }

  HttpFailure _handleError(DioException error) {
    final statusCode = error.response?.statusCode ?? 500;
    if (statusCode == 404) {
      return HttpFailure.notFound;
    } else {
      return HttpFailure.unknown;
    }
  }
}
