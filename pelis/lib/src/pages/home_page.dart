import 'package:flutter/material.dart';
import 'package:pelis/src/providers/peliculas_provider.dart';

import 'package:pelis/src/widgets/card_swiper_widget.dart';
import 'package:pelis/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPelisPopulares();
    return Scaffold(
      //  body: SafeArea(child:Text("Hola mundo")),
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Cartelera"),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[_swiperTarjetas(), _footer(context)],
            ),
         
      ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            peliculas: snapshot.data,
          );
        } else {
          return Container(
              height: 400, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Populares',
                style: Theme.of(context).textTheme.subhead,
              )),
          SizedBox(
            height: 5,
          ),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                  peliculas: snapshot.data,
                  siguientePagina: peliculasProvider.getPelisPopulares,
                );
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
