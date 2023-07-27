import 'package:feel_better/api/api_end_points.dart';
import 'package:feel_better/api/network_client.dart';
import 'package:feel_better/model/photo.dart';
import 'package:feel_better/model/video.dart';

class ApiController {
  static final NetworkClient _networkClient = NetworkClient();

  //curated
  Future<List<Photo>> getCuratedPhotos(Map<String, dynamic> query) async {
    try {
      var response =
          await _networkClient.request(ApiEndPoints.curated, queries: query);
      var decodedResponse = PhotoData.fromJson(response.data);
      return decodedResponse.photos;
    } catch (e) {
      throw Exception(e);
    }
  }

  // search
  Future<List<Photo>> getSearchedPhotos(Map<String, dynamic> query) async {
    try {
      var response =
          await _networkClient.request(ApiEndPoints.search, queries: query);
      var decodedResponse = PhotoData.fromJson(response.data);
      return decodedResponse.photos;
    } catch (e) {
      throw Exception(e);
    }
  }

  //video popular
  Future<List<Video>> getPopularVideos(Map<String, dynamic> query) async {
    try {
      var response =
          await _networkClient.request(ApiEndPoints.popular, queries: query);
      var decodedResponse = VideoData.fromJson(response.data);
      return decodedResponse.videos;
    } catch (e) {
      throw Exception(e);
    }
  }
}
