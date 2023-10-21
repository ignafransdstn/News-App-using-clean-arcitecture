import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.deepPurple.shade200,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.deepPurple,
    shadowColor: Colors.deepPurple.shade300,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: Color(0XFF8B8B8B),
    ),    
    titleTextStyle: const TextStyle(color: Color(0XFF8B8B8B), fontSize: 25, fontWeight: FontWeight.bold),
  );
}
