import 'package:flutter/material.dart';
import 'typography.dart';

class AppTheme {
  static final ColorScheme darkScheme = ColorScheme.fromSeed(
    seedColor: Colors.indigo,
    brightness: Brightness.dark,
  );

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Inter',
      colorScheme: darkScheme,
      textTheme: buildInterTextTheme(darkScheme),
      scaffoldBackgroundColor: darkScheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: darkScheme.surface,
        titleTextStyle: buildInterTextTheme(darkScheme).titleLarge,
        iconTheme: IconThemeData(color: darkScheme.onSurface),
      ),
      cardColor: darkScheme.surfaceVariant,
      useMaterial3: true,
    );
  }
}
