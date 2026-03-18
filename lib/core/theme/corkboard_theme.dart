import 'package:flutter/material.dart';

class CorkboardTheme {
  // Use a Seed Color to generate a harmonious palette
  static const _brandColor = Colors.teal; 

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _brandColor,
      brightness: Brightness.light,
      
      // Customize your GroupCards globally
      cardTheme: CardThemeData(
        elevation: 0, // Flat design is very "Corkboard"
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Consistent spacing for buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}