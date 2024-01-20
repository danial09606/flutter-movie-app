import 'package:flutter/material.dart';
import 'package:movie_app/blocs/movie_bloc.dart';
import 'package:movie_app/models/movie_list_response.dart';
import 'package:movie_app/network/api_response.dart';
import 'package:movie_app/utils/utility.dart';
import 'package:movie_app/views/home/widgets/movie_card.dart';
import 'package:movie_app/widgets/error.dart';
import 'package:movie_app/utils/app_constants.dart';
import 'package:movie_app/views/movie_detail/movie_detail_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home-screen';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieBloc _bloc = MovieBloc();

  @override
  void initState() {
    super.initState();

    _bloc.requestNextPageStream.listen((event) {
      if (event.status == Status.loading) {
      } else if (event.status == Status.completed) {
        setState(() {});
      } else if (event.status == Status.error) {
        showSnackBar(context, event.message, true);
      }
    });

    _bloc.getInitialMoviesList();
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }

  Widget rootWidget() {
    return StreamBuilder<ApiResponse<List<MovieData>>>(
      stream: _bloc.moviesListStream,
      builder: (context, snapshot) {
        if (snapshot.data?.status == Status.loading) {
          return Center(
            child: showLoader(context),
          );
        } else if (snapshot.data?.status == Status.completed) {
          return photosGridView();
        } else if (snapshot.data?.status == Status.error) {
          return Error(
              errorMessage: snapshot.data?.message,
              onRetryPressed: () => _bloc.getInitialMoviesList());
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget photosGridView() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
      child: GridView.builder(
        controller: _bloc.scrollController,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                MovieDetailPage.routeName,
                arguments: MovieDetailPageArgs(
                  movieDetail: _bloc.movieList[index],
                  index: index,
                ),
              );
            },
            child: MovieCard(
              movie: _bloc.movieList[index],
              width: 200,
              height: 200,
            ),
          );
        },
        itemCount: _bloc.movieList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (MediaQuery.of(context).size.width /
                  AppConstant.movieThumbnailSize)
              .round(),
          crossAxisSpacing: AppConstant.movieCrossAxisSpacing,
          mainAxisSpacing: AppConstant.movieMainAxisSpacing,
        ),
        scrollDirection: Axis.vertical,
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'Movie Walaoweh',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: rootWidget(),
    );
  }
}
