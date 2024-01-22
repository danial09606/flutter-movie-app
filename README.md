## Flutter Movie Directory App

### Overview

<p float="left">
    <img src="https://github.com/danial09606/flutter-movie-app/blob/main/images/home_page.png" width="33%">
    <img src="https://github.com/danial09606/flutter-movie-app/blob/main/images/movie_detail_page_1.png" width="33%">
    <img src="https://github.com/danial09606/flutter-movie-app/blob/main/images/movie_detail_page_2.png" width="33%">
</p>

Movie Walaweh app is the app that show user lists of movies released in 2016 (01-01-2016 - 30-12-2016). Users can obtained all the details of the movie such as language, duration, overview, rating and etc. Sources of the data are coming from TMDB's API.

This app is for my learning flutter purposes

### Endpoints

- **Get Movie Lists:** https://api.themoviedb.org/3/discover/movie?api_key=328c283cd27bd1877d9080ccb1604c91&primary_release_date.lte=2016-12-31&primary_release_date.gte=2016-01-01&sort_by=release_date.desc&page=1
- **Get Movie Details:** https://api.themoviedb.org/3/movie/:movieId:?api_key=328c283cd27bd1877d9080ccb1604c91
- **Get Movie Image:** https://image.tmdb.org/t/p/w500/:image_path:

### Architecture

In this project, I use Block architecture.

![Alt text](https://github.com/danial09606/flutter-movie-app/blob/main/images/bloc_architecture.png)

1. home_page widgets will send an event to movie_bloc to do API getMoviesList call. Once received the response movie_bloc will send back streams to home_page to update widget

2. movie_detail_page widget will send an event to movie_bloc to do API getMoviesDetails call. Once received the response movie_bloc will send back streams to movie_detail_page to update widget
