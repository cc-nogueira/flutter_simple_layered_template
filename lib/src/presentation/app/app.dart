import 'package:flutter/material.dart';

import 'routes.dart';

/// Weather App is this application MaterialApp.
class App extends StatelessWidget {
  /// Const constructor
  const App({super.key});

  /// Internal routes object.
  final _routes = const Routes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'App',
      onGenerateRoute: _routes.onGenerateRoute,
      initialRoute: Routes.home,
    );
  }
}
