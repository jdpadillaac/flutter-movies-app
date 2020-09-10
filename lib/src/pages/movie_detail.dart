import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieDeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _createAppBar(movie),
        SliverList(
          delegate: SliverChildListDelegate(
              [SizedBox(height: 10.0), _posterTile(movie)]),
        )
      ],
    ));
  }

  Widget _createAppBar(Pelicula movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(movie.getBackGroundImage()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTile(Pelicula movie) {
    return Container(
      child: Row(children: <Widget>[
        Image(
          image: NetworkImage(movie.getPosterImge()),
          height: 150.0,
        )
      ]),
    );
  }
}
