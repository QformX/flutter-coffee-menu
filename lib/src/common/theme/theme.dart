import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Arial',
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  ),
  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.black.withOpacity(0.0)
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all(Colors.white),
      iconSize: WidgetStateProperty.all(9.0),
    )
  )
);