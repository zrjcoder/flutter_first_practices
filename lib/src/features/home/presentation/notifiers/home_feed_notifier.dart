import 'package:flutter_application_hello/src/features/home/data/data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_feed_notifier.g.dart';

typedef HomeFeedData = ({RecommendFeed homeFeed});

@riverpod
class HomeFeedNotifier extends _$HomeFeedNotifier {
  HomeFeedNotifier() : super();

  @override
  Future<HomeFeedData> build() async {
    state = const AsyncValue.loading();
    return _fetch();
  }

  Future<void> fetch() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => _fetch());
  }

  Future<HomeFeedData> _fetch() async {
    final HomeRepositoryApi homeRepository = ref.read(homeRepositoryProvider);

    final homeFeedSuccessOrFailure =
        await homeRepository.getRecommendHomeFeed();
    final homeFeed = homeFeedSuccessOrFailure.feed;

    if (homeFeed == null) {
      throw homeFeedSuccessOrFailure.failure!.description;
    }

    return (homeFeed: homeFeed);
  }
}
