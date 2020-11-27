import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pelis/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({@required  this.peliculas});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
     
    
    return Container(
      
      //padding: EdgeInsets.only(top: 30),
     
      child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width* 0.7,
          itemHeight: _screenSize.height *0.5,


          itemBuilder: (BuildContext context,int index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                image: NetworkImage(peliculas[index].getPosterImg()),
                placeholder: AssetImage('assets/img/loading.gif'),
                fit: BoxFit.cover,
              ),
            );
            
            
          },
         
         // control: new SwiperControl(),
          
      
          itemCount: peliculas.length,
          //pagination: new SwiperPagination(),
          
        ),
    );
  }
}