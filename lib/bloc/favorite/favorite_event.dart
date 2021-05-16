part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class ToggleFavorites extends FavoriteEvent {
  final WordPair word;

  ToggleFavorites(this.word);
}
