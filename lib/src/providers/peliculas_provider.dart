import 'dart:async';
import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/src/providers/providers.dart';


class PelicupasProvider {
  // String _apiKey = 'dd67162a2b4ffb68267a204a4ec24d18';


  int _popularesPage = 0;
  bool _loading = false;

  List<Pelicula> _populares = new List();

  final _popularesStream = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSync => _popularesStream.sink.add;
  Stream<List<Pelicula>> get popularesStream => _popularesStream.stream;

  void disposeStreams() {
    _popularesStream.close();
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(apiUrl, '3/movie/now_playing',
        {'api_key': apiKey, 'language': apiLanguage});

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getPopulares() async {

    if (_loading) return [];

    _loading = true;

    _popularesPage++;
    
    print('Cargando sigueintes');

    final url = Uri.https(apiUrl, '3/movie/popular', {
      'api_key': apiKey,
      'language': apiLanguage,
      'page': _popularesPage.toString()
    });

    final list = await _procesarRespuesta(url);
    _populares.addAll(list);
    popularesSync(_populares);
    _loading = false;
    return list;
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);
    return peliculas.items;
  }
}
