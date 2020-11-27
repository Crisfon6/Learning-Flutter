import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pelis/src/models/pelicula_model.dart';

class PeliculasProvider{
  String _apiKey = '40aeb7e5168e670e77e2168430e38855';
  String _url = 'api.themoviedb.org';
  String _lenguage = 'es-ES';
  int _popularesPage =0;
  bool _cargando = false;

  List<Pelicula> _populares =new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function (List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStream(){
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async{

    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {

    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key':_apiKey,
      'language': _lenguage,
       //'region':
    });
    return await _procesarRespuesta(url);
    // final response = await http.get(url);
    // final decodedData = json.decode(response.body);
    // final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    
    // return peliculas.items;
  }

  Future<List<Pelicula>> getPelisPopulares() async {
    if(_cargando) return [];
    _cargando=true;

    
    _popularesPage++;
    print('cargando sig..........');

    final url = Uri.https(_url, '3/movie/popular',{
      'api_key':_apiKey,
      'language': _lenguage,
      'page': _popularesPage.toString(),

    });


    final resp = await _procesarRespuesta(url);
    _populares.addAll(resp);
    popularesSink(_populares);
    _cargando=false;
    return resp;

    
    // return await _procesarRespuesta(url);
    // final response = await http.3323get(url);
    // final decodedData = json.decode(response.body);
    // final peliculasPopulares = new Peliculas.fromJsonList(decodedData['results']);
    
    // return peliculasPopulares.items;
  }
}


//API Key: 40aeb7e5168e670e77e2168430e38855