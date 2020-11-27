import 'package:componentes/src/pages/alert_page.dart';
import 'package:icons_helper/icons_helper.dart';
import 'package:componentes/main.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("COmponentes"),centerTitle: true,),
      body: _list(),
          );
        }
      
        Widget _list() {
         // print(menuProvider.opciones);
        //  menuProvider.cargarData().then((opciones){
        //    print("_lista");
        //    print(opciones);

        //  });no hacer asi se queda trabada la app por que esperara mientras carga la data
        return FutureBuilder(
            future: menuProvider.cargarData(),
            initialData: [],
            builder: ( context ,  AsyncSnapshot<List<dynamic>> snapshot){
             
                return ListView(
            children: _listItem(snapshot.data,context),
                       ); 
            },


        );

           
                    }
            
       List<Widget>       _listItem(List<dynamic> data,BuildContext context) {
          final List<Widget> opciones = [];

          data.forEach((opt){
            final widgetTemp = ListTile(
              title: Text(opt['texto']),
              //leading: getIcon(opt['icon']),
              leading: Icon(getIconUsingPrefix(name: ".${opt['icon']}")),
              trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,) ,
              onTap: (){
                // final route = MaterialPageRoute(
                //   builder: (context)=>   AlertPage()
                  
                // );
                // Navigator.push(context, route );
                
                Navigator.pushNamed(context, opt['ruta']);
              },
            );
            opciones..add(widgetTemp)
          ..add(Divider());
            
          });
          return(opciones);
       }
}