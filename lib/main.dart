import 'package:bmi_app/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: const Color.fromRGBO(11, 22, 41, 1),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          //That is for Result Headers .
          headline1: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
          //That is for titles .
          headline2: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(11, 22, 41, 1),
          ),
          //That is for Values of Weigth and age .
          headline3: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          //That is for Calc Btn .
          headline4: TextStyle(fontSize: 25, color: Colors.white),
          //That is for Result Values .
          headline5: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const Splash(),
    );
  }
}
