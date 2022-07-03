import 'dart:async';

import 'package:art_crimes/models/art.dart';
import 'package:art_crimes/repositories/art_crimes_local_repository.dart';
import 'package:art_crimes/repositories/art_crimes_remote_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'art_crimes_event.dart';

part 'art_crimes_state.dart';

const throttleDuration = Duration(milliseconds: 500);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ArtCrimesBloc extends Bloc<ArtCrimesEvent, ArtCrimesState> {
  final ArtCrimesRemoteRepository artCrimesRemoteRepository;
  final ArtCrimesLocalRepository artCrimesLocalRepository;
  int page = 1;

  ArtCrimesBloc({required this.artCrimesLocalRepository, required this.artCrimesRemoteRepository}) : super(const ArtCrimesState()) {
    on<FetchArtCrimes>(
      onFetchArtCrimes,
      transformer: throttleDroppable(throttleDuration),
    );
    on<RefreshArtCrimes>(onRefreshArtCrimes);
    on<LoadFromCacheArtCrimes>(onLoadFromCacheArtCrimes);
  }

  Future<void> onFetchArtCrimes(FetchArtCrimes event, Emitter<ArtCrimesState> emit) async {
    if (state.hasReachedMax) return;
    var connectivityResult = await (Connectivity().checkConnectivity());

    try {
      if (state.status == ArtCrimesStatus.initial) {
        final artCrimes = await artCrimesRemoteRepository.fetchArtCrimes(page);
        artCrimesLocalRepository.addArtCrimes(artCrimes);
        return emit(state.copyWith(status: ArtCrimesStatus.success, artCrimes: artCrimes, hasReachedMax: false));
      }

      if (connectivityResult == ConnectivityResult.none) {
        return emit(state.copyWith(status: ArtCrimesStatus.noInternetConnection, artCrimes: state.artCrimes));
      }
      page++;
      final artCrimes = await artCrimesRemoteRepository.fetchArtCrimes(page);

      artCrimes.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(status: ArtCrimesStatus.success, artCrimes: List.of(state.artCrimes)..addAll(artCrimes), hasReachedMax: false));
    } catch (_) {
      emit(state.copyWith(status: ArtCrimesStatus.failure));
    }
  }

  Future<void> onRefreshArtCrimes(RefreshArtCrimes event, Emitter<ArtCrimesState> emit) async {
    page = 1;
    try {
      emit(state.copyWith(status: ArtCrimesStatus.initial, artCrimes: [], hasReachedMax: false));
      final artCrimes = await artCrimesRemoteRepository.fetchArtCrimes(page);
      artCrimesLocalRepository.addArtCrimes(artCrimes);
      return emit(state.copyWith(status: ArtCrimesStatus.success, artCrimes: artCrimes, hasReachedMax: false));
    } catch (_) {
      emit(state.copyWith(status: ArtCrimesStatus.failure));
    }
  }

  Future<void> onLoadFromCacheArtCrimes(LoadFromCacheArtCrimes event, Emitter<ArtCrimesState> emit) async {
    try {
      emit(state.copyWith(status: ArtCrimesStatus.initial, artCrimes: [], hasReachedMax: false));
      final artCrimes = await artCrimesLocalRepository.getArtCrimes();
      return emit(state.copyWith(status: ArtCrimesStatus.success, artCrimes: artCrimes, hasReachedMax: false));
    } catch (_) {
      emit(state.copyWith(status: ArtCrimesStatus.failure));
    }
  }
}
