import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_list_response.dart';
import 'package:movie_app/widgets/cached_image.dart';
import 'package:movie_app/network/endpoints.dart';
import 'package:movie_app/widgets/image_card_content.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 12,
    this.contentPadding,
    required this.movie,
    this.tags,
    this.footer,
    this.color = Colors.white,
    this.tagSpacing,
    this.tagRunSpacing,
  });

  final double width;
  final double height;
  final double borderRadius;
  final double? tagSpacing;
  final double? tagRunSpacing;
  final EdgeInsetsGeometry? contentPadding;
  final MovieData movie;
  final List<Widget>? tags;
  final Color color;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: Offset(
                5.0,
                5.0,
              ),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 0, left: 12, right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedImage(
                    url: movie.posterPath == null
                        ? null
                        : '${Endpoints.themovieDBImage}${movie.posterPath}',
                    width: width,
                    height: height * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ImageCardContent(
              contentPadding: contentPadding,
              tags: tags,
              title: Text(
                movie.originalTitle ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              footer: footer,
              description: Text('Popularity: ${movie.popularity ?? 0.0}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  )),
              tagSpacing: tagSpacing,
              tagRunSpacing: tagRunSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
