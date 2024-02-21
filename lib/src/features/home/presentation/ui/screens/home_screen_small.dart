import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_application_hello/src/features/features.dart';
import 'package:flutter_application_hello/src/features/home/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenSmall extends ConsumerStatefulWidget {
  const HomeScreenSmall({super.key});

  @override
  ConsumerState<HomeScreenSmall> createState() => _HomeScreenSmallState();
}

class _HomeScreenSmallState extends ConsumerState<HomeScreenSmall>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void loadData() {
    ref.read(homeFeedNotifierProvider.notifier).fetch();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeFeedNotifierProvider).maybeWhen(
            orElse: () => loadData(),
            data: (_) => null,
          );
    });

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeDataState = ref.watch(homeFeedNotifierProvider);

    if (!homeDataState.isLoading) {
      _animationController.stop();
      _animationController.reset();
    }

    return Scaffold(
      appBar: context.isSmallScreen
          ? AppBar(
              centerTitle: true,
              title: const Text('首页'),
            )
          : null,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        child: homeDataState.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const LoadingWidget(),
          data: (feeds) {
            final RecommendFeed homeFeed = feeds.homeFeed;

            return RefreshIndicator(
              onRefresh: () async => loadData(),
              child: Container(
                color: Theme.of(context).primaryColor,
                child: ListView(
                  children: <Widget>[
                    if (!context.isSmallScreen) const SizedBox(height: 30.0),
                    RecommendSection(homeFeed: homeFeed),
                  ],
                ),
              ),
            );
          },
          error: (_, __) {
            return MyErrorWidget(refreshCallBack: loadData);
          },
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value * 2 * pi,
            child: FloatingActionButton(
              onPressed: () async {
                loadData();
                _animationController.repeat();
              },
              child: const Icon(Icons.refresh_rounded),
            ),
          );
        },
      ),

      // FloatingActionButton(
      //   onPressed: () async => loadData(),
      //   child: const Icon(Icons.refresh_rounded),
      // ),
    );
  }
}
