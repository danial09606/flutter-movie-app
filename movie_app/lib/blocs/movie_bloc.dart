import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/blocs/base_bloc.dart';
import 'package:movie_app/models/movie_list_response.dart';
import 'package:movie_app/network/api_base_helper.dart';
import 'package:movie_app/network/api_response.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/utils/app_hive.dart';

class MovieBloc extends BaseBloc {
  final MoviesRepository _repo = MoviesRepository();
  final StreamController<ApiResponse<List<MovieData>>> _scMoviesList =
      StreamController<ApiResponse<List<MovieData>>>();

  final StreamController<ApiResponse<MovieData>> _scMoviesData =
      StreamController<ApiResponse<MovieData>>();

  final StreamController<ApiResponse<List<MovieData>>> _scRequestNextPage =
      StreamController<ApiResponse<List<MovieData>>>();

  StreamSink<ApiResponse<List<MovieData>>> get moviesListSink =>
      _scMoviesList.sink;
  StreamSink<ApiResponse<MovieData>> get moviesDataSink => _scMoviesData.sink;
  Stream<ApiResponse<List<MovieData>>> get moviesListStream =>
      _scMoviesList.stream;
  Stream<ApiResponse<MovieData>> get moviesDataStream => _scMoviesData.stream;

  StreamSink<ApiResponse<List<MovieData>>> get requestNextPageSink =>
      _scRequestNextPage.sink;
  Stream<ApiResponse<List<MovieData>>> get requestNextPageStream =>
      _scRequestNextPage.stream;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  final List<MovieData> _movieList = [];

  MovieData _movieData = MovieData();

  List<MovieData> get movieList => _movieList;

  MovieData get movieData => _movieData;

  int pageNumber = 1;
  bool hasNextPage = true;

  MovieBloc() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        requestNextPage();
      }
    });
  }

  void getMovieList(StreamSink<ApiResponse<List<MovieData>>> sink,
      [bool checkDB = false]) async {
    sink.add(ApiResponse.loading());

    try {
      var movieListBox = await Hive.openBox<MovieData>(AppHive.movieListBox);
      var movieGalleryBox = await Hive.openBox(AppHive.movieGalleryBox);

      if (checkDB && movieListBox.values.isNotEmpty) {
        _movieList.addAll(movieListBox.values);

        pageNumber = movieGalleryBox.get(AppHive.nextPageNumberKey);

        sink.add(ApiResponse.completed(null));

        return;
      }

      if (hasNextPage) {
        final Response<List<MovieData>> response =
            await _repo.getMoviesList(pageNumber);

        if (pageNumber <= 50) {
          hasNextPage = true;
          pageNumber++;
        } else {
          hasNextPage = false;
        }

        _movieList.addAll(response.body);

        movieListBox.addAll(response.body);

        movieGalleryBox.put(AppHive.nextPageNumberKey, pageNumber);
        movieGalleryBox.put(AppHive.hasNextPageKey, hasNextPage);
      }

      sink.add(ApiResponse.completed(null));
    } catch (e) {
      sink.add(ApiResponse.error(e.toString()));
    }
  }

  void getMovieDetail(
      StreamSink<ApiResponse<MovieData>> sink, num movieId) async {
    sink.add(ApiResponse.loading());
    final Response<MovieData> response = await _repo.getMoviesDetails(movieId);
    _movieData = response.body;
    sink.add(ApiResponse.completed(null));
  }

  void getInitialMoviesList() async {
    getMovieList(moviesListSink, true);
  }

  void requestNextPage() async {
    getMovieList(requestNextPageSink);
  }

  void requestMovieDetail(num movieId) async {
    getMovieDetail(moviesDataSink, movieId);
  }

  @override
  void dispose() {
    _scMoviesList.close();
    _scMoviesData.close();
    _scRequestNextPage.close();
    _scrollController.dispose();
    Hive.close();
  }
}
