import 'package:favorite_places_sergio/screens/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 84, 0, 158),
  background: Color.fromARGB(255, 87, 87, 87),
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.montserratAlternatesTextTheme().copyWith(
    titleSmall: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const PlacesScreen(),
    );
  }
}