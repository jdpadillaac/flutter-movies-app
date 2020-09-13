
import 'dart:convert';

import 'package:peliculas/src/models/actors_model.dart';
import 'package:peliculas/src/providers/providers.dart';
import 'package:http/http.dart' as http;

class ActorsProvider {


  Future<List<Cast>> getCast(String movieId) async {
    final url = Uri.https(apiUrl, '3/movie/$movieId/credits', {
      'api_key': apiKey,
      'language': apiLanguage,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    
    final castList = new CastList.fromJsonList(decodedData['cast']);
    return castList.actors;
  }
}