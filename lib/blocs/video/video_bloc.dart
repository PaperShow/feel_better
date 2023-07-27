import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:feel_better/controllers/api_controller.dart';
import 'package:feel_better/model/video.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final ApiController _apiController;

  VideoBloc(this._apiController) : super(VideoInitial()) {
    on<LoadPopularVideos>(_loadPopularVideos);
  }

  void _loadPopularVideos(
      LoadPopularVideos event, Emitter<VideoState> emit) async {
    try {
      var videoList =
          await _apiController.getPopularVideos({'per_page': event.perPage});
      if (videoList.isEmpty) {
        emit(const VideoNoData());
      } else {
        emit(VideoLoaded(videoList));
      }
    } catch (e) {
      emit(VideoError(e.toString()));
    }
  }
}
