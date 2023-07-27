import 'package:dio/dio.dart';
import 'package:feel_better/api/api_end_points.dart';

class NetworkClient {
  static const baseUrl = ApiEndPoints.url;

  static final Dio _client = Dio();

  Future<Map<String, String>> getHeaders() async {
    Map<String, String> headers = {
      'Authorization':
          '563492ad6f91700001000001b6df629d92e84ed783770548c6269db3'
    };
    return headers;
  }

  Future<Response> request(
    String path, {
    Map<String, dynamic> queries = const {},
  }) async {
    var headers = await getHeaders();
    return _client.get('$baseUrl$path',
        queryParameters: queries, options: Options(headers: headers));
  }
}
