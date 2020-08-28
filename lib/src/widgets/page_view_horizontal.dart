import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PageViewHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;

  PageViewHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.3),
        children: _tarjetas(),
      ),
    );
  }

  List<Widget> _tarjetas() {
    return peliculas.map((e) {
      return Container(
        margin: EdgeInsets.only(right: 5.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/loading.gif'),
                image: NetworkImage(e.getPosterImge()),
                fit: BoxFit.cover,
                height: 151.0,
              ),
            )
          ],
        ),
      );
    }).toList();
  }
}
