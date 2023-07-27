// To parse this JSON data, do
//
//     final videoData = videoDataFromJson(jsonString);
import 'dart:convert';

VideoData videoDataFromJson(String str) => VideoData.fromJson(json.decode(str));

String videoDataToJson(VideoData data) => json.encode(data.toJson());

class VideoData {
  VideoData({
    required this.page,
    required this.perPage,
    required this.totalResults,
    required this.url,
    required this.videos,
  });

  final int page;
  final int perPage;
  final int totalResults;
  final String url;
  final List<Video> videos;

  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
        page: json["page"],
        perPage: json["per_page"],
        totalResults: json["total_results"],
        url: json["url"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total_results": totalResults,
        "url": url,
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
      };
}

class Video {
  Video({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.image,
    required this.duration,
    required this.user,
    required this.videoFiles,
    required this.videoPictures,
  });

  final int id;
  final int width;
  final int height;
  final String url;
  final String image;
  final int duration;
  final User user;
  final List<VideoFile> videoFiles;
  final List<VideoPicture> videoPictures;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        image: json["image"],
        duration: json["duration"],
        user: User.fromJson(json["user"]),
        videoFiles: List<VideoFile>.from(
            json["video_files"].map((x) => VideoFile.fromJson(x))),
        videoPictures: List<VideoPicture>.from(
            json["video_pictures"].map((x) => VideoPicture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "image": image,
        "duration": duration,
        "user": user.toJson(),
        "video_files": List<dynamic>.from(videoFiles.map((x) => x.toJson())),
        "video_pictures":
            List<dynamic>.from(videoPictures.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.url,
  });

  final int id;
  final String name;
  final String url;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

class VideoFile {
  VideoFile({
    required this.id,
    required this.quality,
    required this.fileType,
    required this.width,
    required this.height,
    required this.link,
  });

  final int id;
  final String quality;
  final String fileType;
  final int width;
  final int height;
  final String link;

  factory VideoFile.fromJson(Map<String, dynamic> json) => VideoFile(
        id: json["id"],
        quality: json["quality"],
        fileType: json["file_type"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quality": quality,
        "file_type": fileType,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "link": link,
      };
}

class VideoPicture {
  VideoPicture({
    required this.id,
    required this.picture,
    required this.nr,
  });

  final int id;
  final String picture;
  final int nr;

  factory VideoPicture.fromJson(Map<String, dynamic> json) => VideoPicture(
        id: json["id"],
        picture: json["picture"],
        nr: json["nr"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "nr": nr,
      };
}
