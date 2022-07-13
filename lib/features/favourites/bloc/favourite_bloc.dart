import 'dart:async';

import 'package:art_crimes/models/art.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';

part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(const FavouriteState()) {
    on<StartedFavourite>(onStartedFavourite);
    on<AddFavourite>(onAddFavourite);
    on<RemoveFavourite>(onRemoveFavourite);
  }

  Future<void> onStartedFavourite(StartedFavourite event, Emitter<FavouriteState> emit) async {
    return emit(state.copyWith(favourites: List.of(state.favourites)));
  }

  Future<void> onAddFavourite(AddFavourite event, Emitter<FavouriteState> emit) async {
    return emit(state.copyWith(favourites: List.of(state.favourites)..add(event.artCrimes)));
  }

  Future<void> onRemoveFavourite(RemoveFavourite event, Emitter<FavouriteState> emit) async {
    return emit(state.copyWith(favourites: List.of(state.favourites)..remove(event.artCrimes)));
  }
}
