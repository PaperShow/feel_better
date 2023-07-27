part of 'image_downlaod_bloc.dart';

abstract class ImageDownlaodState extends Equatable {
  const ImageDownlaodState();

  @override
  List<Object> get props => [];
}

class ImageDownlaodInitial extends ImageDownlaodState {}

class ImageDownloadCompleted extends ImageDownlaodState {
  const ImageDownloadCompleted();
}

class ImageDownloadError extends ImageDownlaodState {
  const ImageDownloadError(this.error);
  final String error;
  @override
  List<Object> get props => [];
}
