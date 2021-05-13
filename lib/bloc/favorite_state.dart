part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<WordPair> favoriteList = [];

  @override
  // TODO: implement props
  List<Object> get props => [favoriteList];
}
