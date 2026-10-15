import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SumaDigitos extends StatefulWidget {
  const SumaDigitos({super.key});

  @override
  State<SumaDigitos> createState() => _SumaDigitosState();
}

class _SumaDigitosState extends State<SumaDigitos> {
  final numeroController = TextEditingController();
  String resultado = '';
  String mensaje = '';

  void sumarDigitos() {
    final numero = int.tryParse(numeroController.text.trim());
    if (numero == null || numero <= 0) {
      setState(() {
        mensaje = 'Ingrese un número entero positivo mayor que cero.';
        resultado = '';
      });
      return;
    }

    String respuesta;
    int auxiliar = numero;
    int suma = 0;
    while (auxiliar > 0) {
      suma = suma + auxiliar % 10;
      auxiliar = auxiliar ~/ 10;
    }
    String paridad;
    if (suma % 2 == 0) {
      paridad = 'par';
    } else {
      paridad = 'impar';
    }
    respuesta = 'Suma de dígitos: $suma\nLa suma es $paridad.';
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
      appBar: AppBar(title: const Text('Suma de dígitos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ejercicio 9',
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
              onSubmitted: (_) => sumarDigitos(),
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
              onPressed: sumarDigitos,
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
