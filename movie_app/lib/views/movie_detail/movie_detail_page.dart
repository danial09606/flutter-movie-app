import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_list_response.dart';
import 'package:movie_app/views/movie_detail/widgets/top_list_view.dart';
import 'package:movie_app/network/endpoints.dart';

class MovieDetailPage extends StatefulWidget {
  static const String routeName = '/movie-detail-page';

  final MovieDetailPageArgs args;

  const MovieDetailPage({super.key, required this.args});

  @override
  State<MovieDetailPage> createState() =>
      _MovieDetailPageState(args.movieDetail, args.index);
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  MovieData movieDetail;
  int index;

  _MovieDetailPageState(this.movieDetail, this.index);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Movie Detail';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => Navigator.of(context).pop()),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            TopViewCard(
                imageURL: movieDetail.posterPath == null
                    ? null
                    : '${Endpoints.themovieDBImage}${movieDetail.posterPath}',
                title:
                    "${movieDetail.title} (${movieDetail.releaseDate?.split('-').first})",
                language: movieDetail.originalLanguage),
            SizedBox(height: 15),
            ListTile(
              title: Text('Overview',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: movieDetail.overview != ""
                  ? Text(movieDetail.overview ?? "No Data")
                  : Text(
                      "TMDB don't have an overview translated in English. Help them expand their database by adding one."),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailPageArgs {
  MovieData movieDetail;
  int index;

  MovieDetailPageArgs({required this.movieDetail, required this.index});
}
