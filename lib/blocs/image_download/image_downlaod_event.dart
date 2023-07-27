part of 'image_downlaod_bloc.dart';

abstract class ImageDownlaodEvent extends Equatable {
  const ImageDownlaodEvent();

  @override
  List<Object> get props => [];
}

class LoadDownloadEvent extends ImageDownlaodEvent {
  final Photo photo;

  const LoadDownloadEvent(this.photo);
  @override
  List<Object> get props => [photo];
}
