import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState([]));

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is ToggleFavorites) {
      yield* addToFavorites(event);
    }
  }

  Stream<FavoriteState> addToFavorites(ToggleFavorites event) async* {
    state.favoriteList.contains(event.word)
        ? state.favoriteList.remove(event.word)
        : state.favoriteList.add(event.word);

    yield FavoriteState(state.favoriteList);
  }
}
