part of 'trending_bloc.dart';

abstract class TrendingEvent extends Equatable {
  const TrendingEvent();

  @override
  List<Object> get props => [];
}

class LoadTrendingPhoto extends TrendingEvent {
  final int perPage;

  const LoadTrendingPhoto(this.perPage);

  @override
  List<Object> get props => [perPage];
}
