import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget{
  @override
  createState()=> _ContadorPageState();
  

}

class _ContadorPageState extends State<ContadorPage>{

  TextStyle  _styleText = new TextStyle( fontSize: 25, color: Colors.blue);
  int _conteo= 20;
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
          Text("Tabs Number:",style: _styleText,),
          Text('$_conteo',style: _styleText,),


        ],
        
        mainAxisAlignment: MainAxisAlignment.center,),
      ),
      floatingActionButton: _crearBotones(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 30,),
        FloatingActionButton(child: Icon(Icons.exposure_zero),onPressed: () {
          _conteo=0;
          setState(() {
            
          });
        },),
        Expanded(child: SizedBox(width: 10,)),
        FloatingActionButton(child: Icon(Icons.remove),onPressed: () {
          _conteo--;
          setState(() {
            
          });
        },),
        SizedBox(width: 10,),
        FloatingActionButton(child: Icon(Icons.add),onPressed: () {
          _conteo++;
          setState(() {
            
          });
        },),
      ],
    );
  }

}