part of 'trending_bloc.dart';

abstract class TrendingState extends Equatable {
  const TrendingState();

  @override
  List<Object> get props => [];
}

class TrendingInitial extends TrendingState {
  const TrendingInitial();
  @override
  List<Object> get props => [];
}

class TrendingLoading extends TrendingState {
  const TrendingLoading();
  @override
  List<Object> get props => [];
}

class TrendingLoaded extends TrendingState {
  final List<Photo> photoList;

  const TrendingLoaded(this.photoList);
  @override
  List<Object> get props => [photoList];
}

class TrendingError extends TrendingState {
  final String message;

  const TrendingError(this.message);
  @override
  List<Object> get props => [message];
}

class TrendingNoData extends TrendingState {
  const TrendingNoData();
  @override
  List<Object> get props => [];
}
