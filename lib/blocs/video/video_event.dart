part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class LoadPopularVideos extends VideoEvent {
  final int perPage;

  const LoadPopularVideos(this.perPage);

  @override
  List<Object> get props => [perPage];
}
