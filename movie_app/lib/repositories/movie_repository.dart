import 'package:movie_app/models/movie_list_response.dart';
import 'package:movie_app/network/api_base_helper.dart';
import 'package:movie_app/network/endpoints.dart';

class MoviesRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Response<List<MovieData>>> getMoviesList(int pageNumber) async {
    final Response response = await _helper.get(
        '${Endpoints.baseURL}discover/movie?api_key=${EndpointKeys.movieDBAPIKey}&primary_release_date.lte=2016-12-31&primary_release_date.gte=2016-01-01&sort_by=release_date.desc&page=$pageNumber');
    return Response(movieListFromJson(response.body), response.statusCode,
        response.headers);
  }
}
