import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 300.0,
      child: new Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: 200.0,

        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "http://via.placeholder.com/350x150",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}