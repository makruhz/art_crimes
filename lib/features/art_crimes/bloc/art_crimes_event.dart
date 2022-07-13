part of 'art_crimes_bloc.dart';

abstract class ArtCrimesEvent extends Equatable {
  const ArtCrimesEvent();

  @override
  List<Object?> get props => [];
}

class FetchArtCrimes extends ArtCrimesEvent {}

class RefreshArtCrimes extends ArtCrimesEvent {}

class LoadFromCacheArtCrimes extends ArtCrimesEvent {}
