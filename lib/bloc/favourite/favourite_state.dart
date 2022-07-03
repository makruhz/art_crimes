part of 'favourite_bloc.dart';

class FavouriteState extends Equatable {
  final List<Art> favourites;

  const FavouriteState({this.favourites = const <Art>[]});

  FavouriteState copyWith({
    List<Art>? favourites,
  }) {
    return FavouriteState(
      favourites: favourites ?? this.favourites,
    );
  }

  @override
  List<Object> get props => [favourites];
}
