part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {
  const VideoLoading();
}

class VideoLoaded extends VideoState {
  final List<Video> videoList;

  const VideoLoaded(this.videoList);

  @override
  List<Object> get props => [videoList];
}

class VideoNoData extends VideoState {
  const VideoNoData();
}

class VideoError extends VideoState {
  final String message;

  const VideoError(this.message);
  @override
  List<Object> get props => [message];
}
