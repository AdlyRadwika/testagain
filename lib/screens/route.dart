import 'package:flutter/material.dart';
import 'package:test_again/screens/detail/detail.dart';
import 'package:test_again/screens/home/home.dart';

const homeScreen = 'home_screen';
const detailScreen = 'detail_screen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case detailScreen:
      return MaterialPageRoute(
        builder: (context) => const DetailScreen(),
      );
    default:
      throw ('Page is not found!');
  }
}