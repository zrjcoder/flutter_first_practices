import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:uuid/uuid.dart';

class BookCard extends StatelessWidget {
  final String img;
  final SubjectCollectionItem entry;

  BookCard({super.key, required this.img, required this.entry});

  static const uuid = Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageCover(
          img: img,
        ),
        Text(entry.title ?? '暂无'),
        const SizedBox(height: 4),
        ScoreStarRating(score: entry.rating?.value ?? 0.0),
      ],
    );
  }
}

class ImageCover extends StatelessWidget {
  final String img;

  const ImageCover({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.0,
      height: 180.0,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        elevation: 4.0,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          onTap: () {},
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: CachedNetworkImage(
              imageUrl: img,
              httpHeaders: const {
                'User-Agent': userAgent,
              },
              placeholder: (context, url) => const LoadingWidget(
                isImage: true,
              ),
              errorWidget: (context, url, error) {
                return Image.asset(
                  'assets/images/place.png',
                  fit: BoxFit.cover,
                );
              },
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreStarRating extends StatelessWidget {
  final double score;
  final int maxStarCount;
  final double starSize;
  final Color filledStarColor;
  final Color unfilledStarColor;

  const ScoreStarRating({
    super.key,
    required this.score,
    this.maxStarCount = 5,
    this.starSize = 14.0,
    this.filledStarColor = Colors.orange,
    this.unfilledStarColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    double starValue = score / 2; // 将分数转换为5颗星的比例
    for (int i = 0; i < maxStarCount; i++) {
      if (starValue > i + 0.5) {
        stars.add(Icon(Icons.star, size: starSize, color: filledStarColor));
      } else if (starValue > i) {
        stars
            .add(Icon(Icons.star_half, size: starSize, color: filledStarColor));
      } else {
        stars.add(
            Icon(Icons.star_border, size: starSize, color: unfilledStarColor));
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: stars),
        SizedBox(width: 4),
        Text('${score.toStringAsFixed(1)}',
            style: TextStyle(fontSize: starSize, color: Colors.orange)),
      ],
    );
  }
}
