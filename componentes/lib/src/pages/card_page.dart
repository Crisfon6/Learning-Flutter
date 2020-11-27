import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cards"),),

    body: ListView(
      padding: EdgeInsets.all(12),
      children: <Widget>[
      _cardTipo1(),
      SizedBox(height: 30.0,),
      _cardTipo2(),
      SizedBox(height: 30.0,),
       _cardTipo1(),
      SizedBox(height: 30.0,),
      _cardTipo2(),
      SizedBox(height: 30.0,),
       _cardTipo1(),
      SizedBox(height: 30.0,),
      _cardTipo2(),
      SizedBox(height: 30.0,),
            
                ],),
            
                );
              }
            
             Widget _cardTipo1() {
               return Card(
                 elevation: 20,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                 child: Column(
                   children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.photo_album),
                      title: Text("data"),
                      subtitle: Text("sdmaoisdmaoisdmaoimdaoissssssssssssssssssssssssssssssssss     amdsoaddddddddddddddddddddd"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      FlatButton(
                        child: Text("Cancelar"),
                        onPressed: (){
      
                        },
                      ),
                       FlatButton(
                        child: Text("Ok"),
                        onPressed: (){
                          
                        },
                      )
                    ],
                    )
      
                     
                    
                   ],
                 ),
               );
             }
      
        Widget _cardTipo2() { 
          final card =  Container(
            //clipBehavior: Clip.antiAlias,

            child: 
          Column(
            children: <Widget>[
              FadeInImage(
              image: NetworkImage('https://picsum.photos/2000/1600'),
                 //placeholder: AssetImage('assets/073 jar-loading.gif'),
                 placeholder: AssetImage('assets/073 jar-loading.gif'),
                 fadeInDuration: Duration(milliseconds: 300),
                height: 300.0,
                fit: BoxFit.cover,
               ),
              //Image(image: NetworkImage('https://graaat.com/wp-content/uploads/2017/01/Beautiful-Landscapes-image-beautiful-landscapes-36505204-599-674.jpg')),
              Container(
                padding: EdgeInsets.all(20),
                child: Text("I dont have idea")),
            ],
          ),);

          return Container(
            
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: Offset(2.0,-10)
                )
              ]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              
              child: card,),);


        }
}
