import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup_namer/bloc/favorite/favorite_bloc.dart';
import 'random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: RandomWords(),
      ),
    );
  }
}
