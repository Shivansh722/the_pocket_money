import 'package:flutter/material.dart';
//theme of the entire application
//color palette
//font family

 ThemeData lightMode = ThemeData(
 colorScheme:const ColorScheme.light(
  background: Color.fromARGB(255, 254, 249, 248),
  onBackground: Color.fromARGB(255, 240, 235, 234),
  // primary: Colors.white,
  // // onPrimary: Color.fromARGB(255, 30,218,147),
  // tertiary: Color.fromARGB(255, 30,218,147),
  // onTertiary: Color.fromARGB(255, 255,193,42),
  // secondary: Color.fromARGB(255, 239,124,122),
  // onSecondary: Color.fromARGB(255,186,92,232),
  // secondaryContainer: Color.fromARGB(255,26,102,72),
  // surface:Color.fromARGB(255, 110,163,240),
  
 ),
  
  fontFamily: 'Montserrat',
  textTheme:const TextTheme(
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
  ),
);