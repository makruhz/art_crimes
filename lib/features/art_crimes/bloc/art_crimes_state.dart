part of 'art_crimes_bloc.dart';

enum ArtCrimesStatus { initial, success, failure, noInternetConnection }

class ArtCrimesState extends Equatable {
  const ArtCrimesState({this.status = ArtCrimesStatus.initial, this.artCrimes = const <Art>[], this.hasReachedMax = false});

  final ArtCrimesStatus status;
  final List<Art> artCrimes;
  final bool hasReachedMax;

  ArtCrimesState copyWith({
    ArtCrimesStatus? status,
    List<Art>? artCrimes,
    bool? hasReachedMax,
  }) {
    return ArtCrimesState(
      status: status ?? this.status,
      artCrimes: artCrimes ?? this.artCrimes,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, artCrimes, hasReachedMax];
}
