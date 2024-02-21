import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class MediaPreview extends StatelessWidget {
  final List<dynamic> images;
  final List<dynamic> largeImages;
  const MediaPreview({
    super.key,
    required this.images,
    this.largeImages = const [],
  });

  void _openImageGallery(BuildContext context, int initialIndex) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              // backgroundColor: Colors.transparent,
              backgroundColor: Colors.black,
              insetPadding: const EdgeInsets.all(0),
              child: GalleryWidget(
                images: largeImages,
                initialIndex: initialIndex,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8.0,
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      children: List.generate(images.length, (index) {
        return GestureDetector(
          onTap: () => _openImageGallery(context, index),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: images[index],
                fit: BoxFit.cover,
                httpHeaders: const {'User-Agent': userAgent},
              ),
            ),
          ),
        );
      }),
    );
  }
}

class GalleryWidget extends StatelessWidget {
  final List<dynamic> images;
  final int initialIndex;

  const GalleryWidget({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      itemCount: images.length,
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: CachedNetworkImageProvider(
            images[index],
            headers: const {
              'User-Agent': userAgent,
            },
          ),
          onTapUp: (context, details, controllerValue) {
            Navigator.of(context).pop();
          },
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2,
        );
      },
      pageController: PageController(initialPage: initialIndex),
      backgroundDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      scrollPhysics: const BouncingScrollPhysics(),
      loadingBuilder: (context, event) => Center(
        child: CircularProgressIndicator(
          value: event == null
              ? 0
              : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 0),
        ),
      ),
    );
  }
}
