import 'package:flutter/material.dart';

import 'color_scheme.g.dart';

/// ThemeBuilder for Material3 with generated ColorScheme.
///
/// Exposes a dark and a light theme option.
class ThemeBuilder {
  /// Getter for darkTheme
  static final darkTheme = ThemeData(brightness: Brightness.dark, useMaterial3: true, colorScheme: darkColorScheme);

  /// Getter for lightTheme
  static final lightTheme = ThemeData(brightness: Brightness.light, useMaterial3: true, colorScheme: lightColorScheme);
}
