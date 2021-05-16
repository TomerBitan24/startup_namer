import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup_namer/bloc/favorite/favorite_bloc.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  Widget _buildRow(WordPair pair) {
    // final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return Icon(
            state.favoriteList.contains(pair)
                ? Icons.favorite
                : Icons.favorite_border,
            color: state.favoriteList.contains(pair) ? Colors.red : null,
          );
        },
      ),
      onTap: () {
        BlocProvider.of<FavoriteBloc>(context).add(ToggleFavorites(pair));
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  //
  // void _pushSaved() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute<void>(
  //       builder: (BuildContext context) {
  //         final tiles = _saved.map(
  //           (WordPair pair) {
  //             return ListTile(
  //               title: Text(pair.asPascalCase, style: _biggerFont),
  //             );
  //           },
  //         );
  //         final divided = tiles.isNotEmpty
  //             ? ListTile.divideTiles(context: context, tiles: tiles).toList()
  //             : <Widget>[];
  //
  //         return Scaffold(
  //           appBar: AppBar(
  //             title: Text('Saved Suggestions'),
  //           ),
  //           body: ListView(children: divided),
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        // actions: [
        //   IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        // ],
      ),
      body: Center(
        child: _buildSuggestions(),
      ),
    );
  }
}
