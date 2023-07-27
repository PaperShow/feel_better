part of 'photo_bloc.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchedPhotoEvent extends PhotoEvent {
  final int perPage;
  final String query;

  const LoadSearchedPhotoEvent({required this.perPage, required this.query});
  @override
  List<Object> get props => [perPage, query];
}
