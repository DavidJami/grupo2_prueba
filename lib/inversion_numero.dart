import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InversionNumero extends StatefulWidget {
  const InversionNumero({super.key});

  @override
  State<InversionNumero> createState() => _InversionNumeroState();
}

class _InversionNumeroState extends State<InversionNumero> {
  final numeroController = TextEditingController();
  String resultado = '';
  String mensaje = '';

  void invertirNumero() {
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
    int invertido = 0;
    while (auxiliar > 0) {
      int digito = auxiliar % 10;
      invertido = invertido * 10 + digito;
      auxiliar = auxiliar ~/ 10;
    }
    respuesta = 'Número original: $numero\nNúmero invertido: $invertido';

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
      appBar: AppBar(title: const Text('Inversión de un número')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ejercicio 8',
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
              onSubmitted: (_) => invertirNumero(),
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
              onPressed: invertirNumero,
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
