import 'package:flutter/material.dart';
import 'package:flutter_coffee_menu/src/common/menu/menu-screen.dart';
import 'package:flutter_coffee_menu/src/common/theme/theme.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuScreen(),
      theme: appTheme,
    );
  }
}