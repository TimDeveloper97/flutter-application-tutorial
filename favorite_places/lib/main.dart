import 'package:favorite_places/screens/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  brightness: Brightness.dark,
  background: const Color.fromARGB(255, 56, 49, 66),
);

final theme = ThemeData().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: colorScheme.background,
    colorScheme: colorScheme,
    textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
      titleSmall: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold, color: Colors.white),
      titleMedium: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold, color: Colors.white),
      titleLarge: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold, color: Colors.white),
      bodyMedium: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold, color: Colors.white),
      bodySmall: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold, color: Colors.white),
      headlineLarge: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold, color: Colors.white),
      headlineSmall: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold, color: Colors.white),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const PlacesScreen(),
    );
  }
}
