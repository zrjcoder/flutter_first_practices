import 'package:dio/dio.dart';
import 'package:flutter_application_hello/src/common/common.dart';

typedef MovieRepositoryData = ({MoviePopularFeed? feed, HttpFailure? failure});

abstract class MovieRepository {
  final Dio httpClient;

  const MovieRepository(this.httpClient);

  Future<MovieRepositoryData> getPopularMovie(String url) async {
    try {
      final response = await httpClient.get(url);
      MoviePopularFeed feed = MoviePopularFeed.fromJson(response.data);
      return (feed: feed, failure: null);
    } on DioException catch (error) {
      final statusCode = error.response?.statusCode ?? 500;
      if (statusCode == 404) {
        return (feed: null, failure: HttpFailure.notFound);
      }
      return (feed: null, failure: HttpFailure.unknown);
    }
  }
}
