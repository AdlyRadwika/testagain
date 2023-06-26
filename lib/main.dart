import 'package:test_again/utils/theme.dart';
import 'package:test_again/utils/providers.dart';
import 'package:test_again/screens/route.dart' as route;
import 'package:flutter/material.dart';
import 'package:test_again/utils/injection.dart' as di;
import 'package:provider/provider.dart';

void main() {
  di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter App',
        theme: myThemeData,
        onGenerateRoute: route.controller,
        initialRoute: route.homeScreen,
      ),
    );
  }
}