List<dynamic> formatMedia({
  required List<dynamic> images,
  String? type,
  String? size = 'normal',
}) {
  if (images.isNotEmpty) {
    return images
        .map(
          (e) => type == 'user' ? e[size]['url'] : e['image'][size]['url'],
        )
        .toList();
  } else {
    return [];
  }
}
