part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitial extends PhotoState {
  @override
  List<Object> get props => [];
}

class PhotoLoading extends PhotoState {
  const PhotoLoading();
  @override
  List<Object> get props => [];
}

class PhotoLoaded extends PhotoState {
  final List<Photo> photoList;
  const PhotoLoaded({
    required this.photoList,
  });

  @override
  List<Object> get props => [photoList];
}

class PhotoError extends PhotoState {
  final String message;
  const PhotoError(this.message);

  @override
  List<Object> get props => [message];
}

class PhotoNoData extends PhotoState {
  const PhotoNoData();
  @override
  List<Object> get props => [];
}
