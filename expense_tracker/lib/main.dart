import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //lock rolate device
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => {runApp(const MyApp())});
}

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.amber);
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 128, 96, 0));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.all(5)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kDarkColorScheme.onSecondaryContainer,
                  fontSize: 18),
              bodyMedium: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kDarkColorScheme.onSecondaryContainer,
                  fontSize: 14),
              bodySmall: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kDarkColorScheme.onSecondaryContainer,
                  fontSize: 12),
              titleMedium: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kDarkColorScheme.onSecondaryContainer,
                  fontSize: 14),
            ),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        // scaffoldBackgroundColor: Colors.amber,
      ).copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.all(5)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.primary,
                fontSize: 18)),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    );
  }
}
