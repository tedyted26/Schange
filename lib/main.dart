import 'package:flutter/material.dart';
import 'routes_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schange',
      theme: ThemeData(
        primaryColor: Color(0xff023047),
        hintColor: Color(0xff219EBC),
        //APP BAR THEME
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          // text style
          titleTextStyle: TextStyle(
            color: Color(0xff023047),
            fontFamily: 'SFUIText',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          shadowColor: Color.fromARGB(56, 190, 193, 255),
          elevation: 1, //o 1 o 0, no me decido
          //icon theme
          iconTheme: IconThemeData(
            color: Color(0xff023047),
            size: 30,
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(0xff023047),
          size: 30,
        ),
      ),
      initialRoute: '/event-details',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
