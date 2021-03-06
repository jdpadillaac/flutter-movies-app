import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PageViewHorizontal extends StatelessWidget {
  PageViewHorizontal(
      {@required this.peliculas, @required this.siguientePagina});

  final List<Pelicula> peliculas;
  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);
  final Function siguientePagina;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: peliculas.length,
        itemBuilder: (context, i) {
          return _card(context, peliculas[i]);
        },
        // itemBuilder:   _tarjetas(context),
      ),
    );
  }

  // List<Widget> _tarjetas(context) {
  //   return peliculas.map((e) {
  //     return Container(
  //       margin: EdgeInsets.only(right: 5.0),
  //       child: Column(
  //         children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(10.0),
  //             child: FadeInImage(
  //               placeholder: AssetImage('assets/img/loading.gif'),
  //               image: NetworkImage(e.getPosterImge()),
  //               fit: BoxFit.cover,
  //               height: 132.0,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 5.0,
  //           ),
  //           Text(
  //             e.title,
  //             overflow: TextOverflow.ellipsis,
  //             style: Theme.of(context).textTheme.caption,
  //           ),
  //         ],
  //       ),
  //     );
  //   }).toList();
  // }

  Widget _card (BuildContext context, Pelicula e) {
    final cardItem = Container(
      margin: EdgeInsets.only(right: 5.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/loading.gif'),
              image: NetworkImage(e.getPosterImge()),
              fit: BoxFit.cover,
              height: 125.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            e.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );

    return GestureDetector(
      child: cardItem,
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: e );
      },
    );
  }
}
