import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:feel_better/controllers/api_controller.dart';
import 'package:feel_better/model/photo.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final ApiController _controller;
  int perPage = 15;

  PhotoBloc(this._controller) : super(PhotoInitial()) {
    on<LoadSearchedPhotoEvent>(_loadSearchedPhoto);
  }

  void _loadSearchedPhoto(
      LoadSearchedPhotoEvent event, Emitter<PhotoState> emit) async {
    emit(const PhotoLoading());
    try {
      var photoList = await _controller
          .getSearchedPhotos({'per_page': event.perPage, 'query': event.query});
      if (photoList.isEmpty) {
        emit(const PhotoNoData());
      } else {
        emit(PhotoLoaded(photoList: photoList));
      }
    } catch (e) {
      emit(PhotoError(e.toString()));
    }
  }
}
