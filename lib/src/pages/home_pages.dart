import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper.dart';
import 'package:peliculas/src/widgets/page_view_horizontal.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PelicupasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
          title: Text('Peliculas en cine'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_swipperTrjetas(), _populares(context)],
          ),
        ));
  }

  Widget _swipperTrjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(items: snapshot.data);
        } else {
          return Container(
            height: 450.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _populares(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Poúlares',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          SizedBox(height: 10.0),
          FutureBuilder(
            future: peliculasProvider.getPopulares(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
              if (snapshot.hasData) {
                return PageViewHorizontal(peliculas: snapshot.data);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
