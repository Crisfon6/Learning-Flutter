import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  bool _bloquearCheck = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sliders"),),
      body:  Container(
        padding: EdgeInsets.only(top: 50  ),

        child: Column(
          children: <Widget>[
            _crearSlider(),
            Text("$_valorSlider"),
          _crearCheckbox(),
          _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),

      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
     //  divisions: 4,
      
      onChanged: (_bloquearCheck) ? null :(valor){
        
        setState(() {
          _valorSlider = valor;
        });
    },
    value: _valorSlider,
    min: 10,
    max: 400,
    );
  }

  Widget _crearImagen() {
    return Image(
      image: AssetImage('assets/mood.gif'),
      fit: BoxFit.contain, 
      width: _valorSlider,
      
    );

  }

  _crearCheckbox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor){
    //     setState(() {
    //      _bloquearCheck = valor; 
    //     });
    //   },
       
    // );
    return CheckboxListTile(
      title: Text("Bloquear slider      "),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
         _bloquearCheck =valor; 
        });
      },
    );
    }

  _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear slider      "),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
         _bloquearCheck =valor; 
        });
      },
    );
  }
}