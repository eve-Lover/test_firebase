import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        //elevation: 1, // 그림자
        actionsIconTheme:
        IconThemeData(
            color: Colors.red
        ),
        titleTextStyle:
        TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 10.0
        )
    ),
    iconTheme: const IconThemeData( color: Colors.black),
    /*
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 1,
        )
        ),*/
);