import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';

class FeaturedSection extends StatelessWidget {
  final List<SubjectCollectionItem> movies;

  const FeaturedSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.0,
      child: Center(
        child: ListView.builder(
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: movies.length,
          itemBuilder: ((context, index) {
            final SubjectCollectionItem movie = movies[index];

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 5.0,
              ),
              child: BookCard(
                img: movie.cover?.url ?? '',
                entry: movie,
              ),
            );
          }),
        ),
      ),
    );
  }
}
