import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_list_response.dart';
import 'package:movie_app/utils/app_constants.dart';
import 'package:movie_app/widgets/cached_image.dart';
// import 'package:movie_app/network/endpoints.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final MovieData movie;

  @override
  Widget build(BuildContext context) {
    return CachedImage(
      url: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
      height: AppConstant.movieThumbnailSize,
      width: AppConstant.movieThumbnailSize,
    );
  }
}
