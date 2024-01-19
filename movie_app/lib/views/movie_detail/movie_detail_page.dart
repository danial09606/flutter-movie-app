import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_list_response.dart';
import 'package:movie_app/views/movie_detail/widgets/custom_list_view.dart';

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
            ListTile(
              title: Text('Overview',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(movieDetail.overview ?? "No Data"),
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
