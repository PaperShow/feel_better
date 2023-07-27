import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:feel_better/model/photo.dart';

import '../../controllers/api_controller.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final ApiController _controller;
  int perPage = 15;

  TrendingBloc(this._controller) : super(const TrendingInitial()) {
    on<LoadTrendingPhoto>(_loadTrendingPhoto);
  }

  void _loadTrendingPhoto(
      LoadTrendingPhoto event, Emitter<TrendingState> emit) async {
    emit(const TrendingLoading());
    try {
      var photoList =
          await _controller.getCuratedPhotos({'per_page': event.perPage});
      if (photoList.isEmpty) {
        emit(const TrendingNoData());
      } else {
        emit(TrendingLoaded(photoList));
      }
    } catch (e) {
      emit(TrendingError(e.toString()));
    }
  }
}
