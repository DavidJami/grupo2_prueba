import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DivisoresNumero extends StatefulWidget {
  const DivisoresNumero({super.key});

  @override
  State<DivisoresNumero> createState() => _DivisoresNumeroState();
}

class _DivisoresNumeroState extends State<DivisoresNumero> {
  final numeroController = TextEditingController();
  String resultado = '';
  String mensaje = '';

  void calcularDivisores() {
    final numero = int.tryParse(numeroController.text.trim());
    if (numero == null || numero <= 0) {
      setState(() {
        mensaje = 'Ingrese un número entero positivo mayor que cero.';
        resultado = '';
      });
      return;
    }

    String respuesta;
    final divisores = <int>[];
    // Cada divisor tiene una pareja: por ejemplo, 2 y 6 para el 12.
    for (int i = 1; i <= numero ~/ i; i++) {
      if (numero % i == 0) {
        divisores.add(i);
        if (i != numero ~/ i) {
          divisores.add(numero ~/ i);
        }
      }
    }
    divisores.sort();
    respuesta =
        'Divisores de $numero:\n${divisores.join(', ')}\n\n'
        'Cantidad de divisores: ${divisores.length}';

    setState(() {
      resultado = respuesta;
      mensaje = '';
    });
  }

  void limpiar() {
    setState(() {
      numeroController.clear();
      resultado = '';
      mensaje = '';
    });
  }

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Divisores de un número')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ejercicio 7',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text('Ingresa un entero positivo de hasta 9 dígitos.'),
            const SizedBox(height: 24),
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 9,
              onSubmitted: (_) => calcularDivisores(),
              decoration: const InputDecoration(
                labelText: 'Número entero positivo',
                hintText: 'Ejemplo: 123',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            if (mensaje.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(mensaje, style: const TextStyle(color: Colors.red)),
              ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: calcularDivisores,
              icon: const Icon(Icons.calculate),
              label: const Text('Calcular'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(onPressed: limpiar, child: const Text('Limpiar')),
            const SizedBox(height: 24),
            if (resultado.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Resultado',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SelectableText(
                        resultado,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
