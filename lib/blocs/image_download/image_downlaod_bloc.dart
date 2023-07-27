import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:feel_better/controllers/download_controller.dart';

import '../../model/photo.dart';

part 'image_downlaod_event.dart';
part 'image_downlaod_state.dart';

class ImageDownlaodBloc extends Bloc<ImageDownlaodEvent, ImageDownlaodState> {
  final DownloadController _controller;
  ImageDownlaodBloc(this._controller) : super(ImageDownlaodInitial()) {
    on<LoadDownloadEvent>(_downloadImage);
  }
  _downloadImage(
      LoadDownloadEvent event, Emitter<ImageDownlaodState> emit) async {
    try {
      var download = await _controller.getDownloadImage(event.photo);
      if (download!) {
        emit(const ImageDownloadCompleted());
      }
    } catch (e) {
      emit(ImageDownloadError(e.toString()));
    }
  }
}
