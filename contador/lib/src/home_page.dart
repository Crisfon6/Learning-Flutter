import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  final  styleText = new TextStyle( fontSize: 25, color: Colors.blue);
  final conteo= 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
        centerTitle: true,
        elevation: 0.0,

      ),
      body: Center(
        child: Column(children: <Widget>[
          Text("Tabs Number:",style: styleText,),
          Text('$conteo',style: styleText,),


        ],
        
        mainAxisAlignment: MainAxisAlignment.center,),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.airplanemode_active),
        onPressed: () {
          print("Hola mundo");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}