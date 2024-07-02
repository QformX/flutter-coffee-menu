import 'package:flutter/material.dart';
import 'package:flutter_coffee_menu/src/app.dart';
import 'package:flutter_coffee_menu/src/common/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuScreen(),
      theme: appTheme,
    );
  }
}
