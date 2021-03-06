import 'package:flutter/material.dart';
import 'package:pelis/src/models/pelicula_model.dart';


class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas,@required this.siguientePagina})  ;
  final _pageController = new PageController( 
        initialPage: 1,
          viewportFraction: 0.3);
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener((){
      if(_pageController.position.pixels>=_pageController.position.maxScrollExtent-200){
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height*0.2,
      child: PageView.builder(
        itemBuilder: (context,i)=>          _tarjeta(context, peliculas[i]),
        
        itemCount: peliculas.length,
        pageSnapping: false,
        controller: _pageController,
        //children: _tarjetas(context),
      ),
    );
  }
  Widget _tarjeta(BuildContext context, Pelicula pelicula){
    return Container(
        
        margin: EdgeInsets.only(right: 10),
        child: Column(
          
          children: <Widget>[
            ClipRRect(
              
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160,
              ),  
            ),
            SizedBox(height: 5,),
            Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
  }

  List<Widget>_tarjetas(BuildContext context) {
    return peliculas.map((pelicula){
      return Container(
        
        margin: EdgeInsets.only(right: 10),
        child: Column(
          
          children: <Widget>[
            ClipRRect(
              
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160,
              ),  
            ),
            SizedBox(height: 5,),
            Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
    }).toList();
  }
}