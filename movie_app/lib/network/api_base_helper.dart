import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

class ApiBaseHelper {
  Future<dynamic> get(String url) async {
    Response returnResponse;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw FetchDataException('Request timeout');
        },
      );
      returnResponse = Response(
          _returnResponse(response), response.statusCode, response.headers);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return returnResponse;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        if (response.body.isNotEmpty) {
          return response.body;
        }
        return '';
      case 204: // No Content
      case 302: // Found
        return '';
      case 400:
      case 401:
      case 403:
      case 404:
      case 500:
        throw BadRequestException(response.body);
      default:
        throw FetchDataException(
            'Network error. StatusCode : ${response.statusCode}');
    }
  }
}

class Response<T> {
  T body;
  int statusCode;
  Map<String, dynamic> headers;

  Response(this.body, this.statusCode, this.headers);
}
