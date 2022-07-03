part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();
}

class StartedFavourite extends FavouriteEvent {
  @override
  List<Object> get props => [];
}

class AddFavourite extends FavouriteEvent {
  final Art artCrimes;

  const AddFavourite(this.artCrimes);

  @override
  List<Object> get props => [artCrimes];
}

class RemoveFavourite extends FavouriteEvent {
  final Art artCrimes;

  const RemoveFavourite(this.artCrimes);

  @override
  List<Object> get props => [artCrimes];
}
