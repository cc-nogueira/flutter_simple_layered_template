import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'theme/theme_builder.dart';

/// This is the MaterialApp.
///
/// Shows the home page in [Routes].
class App extends StatelessWidget {
  /// Const constructor
  const App({super.key});

  /// Internal routes object.
  final _routes = const Routes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeBuilder.darkTheme,
      onGenerateRoute: _routes.onGenerateRoute,
      initialRoute: Routes.home,
    );
  }
}
