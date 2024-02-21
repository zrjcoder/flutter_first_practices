import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_application_hello/src/features/home/data/data.dart';

class RecommendSection extends StatelessWidget {
  final RecommendFeed homeFeed;

  const RecommendSection({super.key, required this.homeFeed});

  @override
  Widget build(BuildContext context) {
    var items = homeFeed.items ?? [];
    items = items.where((element) => element.adInfo == null).toList();

    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: ((context, index) {
        final item = items[index];

        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          margin: const EdgeInsets.only(bottom: 8.0),
          child: RecommendFeedCard(item: item),
        );
      }),
    );
  }
}

class RecommendFeedCard extends StatelessWidget {
  final Item item;

  const RecommendFeedCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final type = item.owner?.type;
    final userContent = item.content?.status;
    final groupContent = item.content;

    final String avatarUrl = item.owner?.avatar ?? '';
    final String avatarName = item.owner?.name ?? '';

    final String text =
        (type == 'user' ? userContent?.text : groupContent?.contentAbstract) ??
            '';
    final String title =
        (type == 'user' ? userContent?.title : groupContent?.title) ?? '';

    // final String tag = '';

    final List<dynamic> groupImages = groupContent?.photos ?? [];
    final List<dynamic> userImages = userContent?.images ?? [];
    final List<dynamic> images = type == 'user' ? userImages : groupImages;

    final int likes = item.reactionsCount ?? 0;
    final int comments = item.commentsCount ?? 0;
    final int shares = item.resharesCount ?? 0;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 头像、昵称
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: CachedNetworkImageProvider(
                  avatarUrl,
                  headers: const {'User-Agent': userAgent},
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                avatarName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          // 内容
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                children: [
                  TextSpan(
                    text: title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                  if (title.isNotEmpty && text.isNotEmpty)
                    const TextSpan(text: '\n'),
                  TextSpan(
                    text: text,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 图片
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MediaPreview(
              images: formatMedia(images: images, type: type),
              largeImages:
                  formatMedia(images: images, type: type, size: 'large'),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAction(Icons.thumb_up_outlined, likes),
              _buildAction(Icons.comment_outlined, comments),
              _buildAction(Icons.share_outlined, shares),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAction(IconData icon, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.grey[500],
          ),
          const SizedBox(width: 4),
          Text('$count'),
        ],
      ),
    );
  }
}
