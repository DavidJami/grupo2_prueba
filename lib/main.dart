import 'package:flutter/material.dart';

import 'menu_ejercicios.dart';

void main() {
  runApp(const AplicacionNumerosGrupoDos());
}

class AplicacionNumerosGrupoDos extends StatelessWidget {
  const AplicacionNumerosGrupoDos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grupo 2 - Números',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        scaffoldBackgroundColor: const Color(0xFFF3F5FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 52),
          ),
        ),
      ),
      home: const MenuEjercicios(),
    );
  }
}
