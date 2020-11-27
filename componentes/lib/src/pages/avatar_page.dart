import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  static final pageName = 'avatar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Avatar"),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            child: Text("data"),
            backgroundColor: Colors.yellow,
            
          ),
        ),
        Container(
          padding: EdgeInsets.all(4),
          child: CircleAvatar(backgroundImage: NetworkImage('https://www.cinepremiere.com.mx/wp-content/uploads/2019/03/batman-logo.jpg'),
          radius: 30,),
        ),

      ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://www.cinepremiere.com.mx/wp-content/uploads/2019/03/batman-logo.jpg'),
          placeholder: AssetImage('assets/073 jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 300),
        ),
      ),
      
    );
  }
}