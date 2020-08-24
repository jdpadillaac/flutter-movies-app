import 'package:flutter/material.dart';
import 'package:peliculas/src/widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
            children: [_swipperTrjetas()],
          ),
        ));
  }

  Widget _swipperTrjetas() {
    return CardSwiper(items: [1, 2, 3, 4, 5]);
  }
}
