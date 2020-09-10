import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/home_pages.dart';
import 'package:peliculas/src/pages/movie_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'detail' : (BuildContext context) => MovieDeDetail()
      },
    );
  }
}
