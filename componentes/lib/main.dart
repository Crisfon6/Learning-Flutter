import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes/src/home_temp.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
       localizationsDelegates: [
   // ... app-specific localization delegate[s] here
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
   GlobalCupertinoLocalizations.delegate,
 ],
 supportedLocales: [
    const Locale('en'), // English
    const Locale('es'), // Hebrew
    // Chinese *See Advanced Locales below*
    // ... other locales the app supports
  ],
    //  home: HomePage(),
    initialRoute: '/',
      // routes: <String,WidgetBuilder>{
      //   '/': (BuildContext context) => HomePage(),
      //   'alert': (BuildContext context) => AlertPage(),
      //   'avatar': (BuildContext context) => AvatarPage(),
      // },
      routes: getAplicationRoutes(),
      onGenerateRoute: (settings ){
          print("ruta llamada: ${settings.name} ");
          return MaterialPageRoute(
            builder: (context) => AlertPage() 

          );
      },
    );
  }
}