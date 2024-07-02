import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Colors.blue, // Основной цвет
  fontFamily: 'Roboto', // Шрифт
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue, // Цвет кнопок
    textTheme: ButtonTextTheme.primary, // Тема текста кнопок
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Форма кнопок
  ),
);