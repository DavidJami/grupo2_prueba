import 'package:flutter/material.dart';

import 'divisores_numero.dart';
import 'inversion_numero.dart';
import 'suma_digitos.dart';

class MenuEjercicios extends StatelessWidget {
  const MenuEjercicios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grupo 2')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.calculate_outlined,
              size: 80,
              color: Colors.indigo,
            ),
            const SizedBox(height: 20),
            const Text(
              'Trabajemos con números',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Selecciona un ejercicio para comenzar.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DivisoresNumero(),
                ),
              ),
              icon: const Icon(Icons.format_list_numbered),
              label: const Text('7. Divisores de un número'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InversionNumero(),
                ),
              ),
              icon: const Icon(Icons.swap_horiz),
              label: const Text('8. Inversión de un número'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SumaDigitos()),
              ),
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('9. Suma de dígitos'),
            ),
          ],
        ),
      ),
    );
  }
}
