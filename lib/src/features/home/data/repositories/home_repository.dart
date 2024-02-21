import 'package:dio/dio.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_application_hello/src/features/home/data/models/RecommendFeed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

typedef RecommendFeedData = ({RecommendFeed? feed, HttpFailure? failure});

abstract class HomeRepository {
  final Dio httpClient;

  HomeRepository(this.httpClient);

  Future<MoviePopularFeed> getPopularHomeFeed();
  Future<RecommendFeedData> getRecommendHomeFeed();
}

class HomeRepositoryApi extends HomeRepository {
  HomeRepositoryApi(super.httpClient);

  @override
  Future<MoviePopularFeed> getPopularHomeFeed() async {
    final response = await httpClient.get(popular);
    MoviePopularFeed feed = MoviePopularFeed.fromJson(response.data);
    return feed;
  }

  @override
  Future<RecommendFeedData> getRecommendHomeFeed() async {
    try {
      final response = await httpClient.get(recommendFeed);
      RecommendFeed feed = RecommendFeed.fromJson(response.data);
      return (feed: feed, failure: null);
    } catch (error) {
      return (feed: null, failure: HttpFailure.unknown);
    }
  }
}

final homeRepositoryProvider = Provider.autoDispose<HomeRepositoryApi>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeRepositoryApi(dio);
});
