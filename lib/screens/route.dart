import 'package:flutter/material.dart';

const homeScreen = 'home_screen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      // return MaterialPageRoute(
      //   builder: (context) => const HomeScreen(),
      // );
    default:
      throw ('Page is not found!');
  }
}