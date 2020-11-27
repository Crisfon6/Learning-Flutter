

import 'package:flutter/material.dart';



class HomePageTemp extends StatelessWidget {
  final opciones = ['uno','dos','tres','cuatro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Temp"),
    
    ),
    body: ListView(
      children: _crearItemsCorto(),
    ),
      
    );
  }
  List<Widget> _crearitems(){

    List<Widget> lista = new List<Widget>();
    for (String item in opciones) {
      final tempWidget = ListTile(
        title: Text(item),
      );
      
      lista..add(tempWidget)
      ..add(Divider());
    }
    return lista;
  }
  List<Widget> _crearItemsCorto(){
    return opciones.map((item) {
      return Column(children: <Widget>[
        ListTile(
          title: Text(item),
          subtitle: Text("Anything"),
          leading: Icon(Icons.ac_unit ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: (){
            
          },
          ),
        Divider(),
      ],
      );
    }).toList();
  

  
  }
}