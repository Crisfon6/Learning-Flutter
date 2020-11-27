import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert"),
      
    ),
    body: Center(
      child: RaisedButton(
    child: Text("Mostrar Alerta"),
    color: Colors.blue,
    textColor: Colors.white,
    shape: StadiumBorder(),
    onPressed: () => _mostrarAlert(context),

    
    ),),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.backspace),
      onPressed: (){
        Navigator.pop(context);
      },
    ),
      
    );
  }
  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("HOla mundo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("ESTo es un alerat"),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cacnelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("Ok"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
          );
      },
    );
  }
}