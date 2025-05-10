import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Filmes',
      debugShowCheckedModeBanner: false,
      themeMode:
          ThemeMode
              .system, // Alterna automaticamente entre claro e escuro baseado no seu sistema.
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      home: const HomePage(),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 33, 150, 243),
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey[100],
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 33, 150, 243),
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey[900],
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
