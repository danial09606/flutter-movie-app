import 'package:flutter/material.dart';
import 'package:movie_app/blocs/movie_bloc.dart';
import 'package:movie_app/models/movie_list_response.dart';
import 'package:movie_app/network/api_response.dart';
import 'package:movie_app/views/movie_detail/widgets/top_list_view.dart';
import 'package:movie_app/network/endpoints.dart';
import 'package:movie_app/utils/utility.dart';
import 'package:movie_app/widgets/error.dart';
import 'package:movie_app/extension/num_extension.dart';

class MovieDetailPage extends StatefulWidget {
  static const String routeName = '/movie-detail-page';

  final MovieDetailPageArgs args;

  const MovieDetailPage({super.key, required this.args});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final MovieBloc bloc = MovieBloc();

  @override
  void initState() {
    super.initState();

    bloc.requestMovieDetail(widget.args.movieId);
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  Widget rootWidget() {
    return StreamBuilder<ApiResponse<MovieData>>(
      stream: bloc.moviesDataStream,
      builder: (context, snapshot) {
        if (snapshot.data?.status == Status.loading) {
          return Center(
            child: showLoader(context),
          );
        } else if (snapshot.data?.status == Status.completed) {
          return movieDetailView();
        } else if (snapshot.data?.status == Status.error) {
          return Error(
              errorMessage: snapshot.data?.message,
              onRetryPressed: () =>
                  bloc.requestMovieDetail(widget.args.movieId));
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget movieDetailView() {
    return ListView(
      children: <Widget>[
        TopViewCard(
            imageURL: bloc.movieData.posterPath == null
                ? null
                : '${Endpoints.themovieDBImage}${bloc.movieData.posterPath}',
            title:
                "${bloc.movieData.title} (${bloc.movieData.releaseDate?.split('-').first})",
            genres: bloc.movieData.genres
                ?.map((item) => item["name"] as String)
                .join(", "),
            duration: bloc.movieData.runtime?.hoursAndMinutes,
            language: bloc.movieData.originalLanguage),
        if (bloc.movieData.tagline != "") SizedBox(height: 5),
        if (bloc.movieData.tagline != "")
          ListTile(
            title: null,
            subtitle: Text(
              "${bloc.movieData.tagline}",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic),
            ),
          ),
        SizedBox(height: 5),
        ListTile(
          title: Text('Overview',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          subtitle: bloc.movieData.overview != ""
              ? Text(bloc.movieData.overview ?? "No Data")
              : Text(
                  "TMDB don't have an overview translated in English. Help them expand their database by adding one."),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: BackButton(onPressed: () => Navigator.of(context).pop()),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'Movie Detail',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Movie Detail';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: appBar(),
        body: rootWidget(),
      ),
    );
  }
}

class MovieDetailPageArgs {
  num movieId;

  MovieDetailPageArgs({required this.movieId});
}
