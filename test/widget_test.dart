import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grupo2_numeros/main.dart';
import 'package:grupo2_numeros/divisores_numero.dart';
import 'package:grupo2_numeros/suma_digitos.dart';

void main() {
  testWidgets('Menú, cálculos, validación y limpieza', (tester) async {
    await tester.pumpWidget(const AplicacionNumerosGrupoDos());
    final casos = [
      [
        '7. Divisores de un número',
        '12',
        'Divisores de 12:\n1, 2, 3, 4, 6, 12\n\nCantidad de divisores: 6',
      ],
      [
        '8. Inversión de un número',
        '120',
        'Número original: 120\nNúmero invertido: 21',
      ],
      ['9. Suma de dígitos', '123', 'Suma de dígitos: 6\nLa suma es par.'],
    ];
    for (final caso in casos) {
      await tester.tap(find.text(caso[0]));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Calcular'));
      await tester.pump();
      expect(
        find.text('Ingrese un número entero positivo mayor que cero.'),
        findsOneWidget,
      );
      await tester.enterText(find.byType(TextField), caso[1]);
      await tester.tap(find.text('Calcular'));
      await tester.pump();
      expect(find.text(caso[2]), findsOneWidget);
      await tester.tap(find.text('Limpiar'));
      await tester.pump();
      expect(find.text(caso[2]), findsNothing);
      expect(
        tester.widget<TextField>(find.byType(TextField)).controller!.text,
        isEmpty,
      );
      await tester.pageBack();
      await tester.pumpAndSettle();
    }
  });

  testWidgets('Divisor único, cuadrado perfecto, suma impar y cero', (
    tester,
  ) async {
    for (final caso in [
      [7, '1', 'Divisores de 1:\n1\n\nCantidad de divisores: 1'],
      [7, '9', 'Divisores de 9:\n1, 3, 9\n\nCantidad de divisores: 3'],
      [9, '12', 'Suma de dígitos: 3\nLa suma es impar.'],
    ]) {
      await tester.pumpWidget(
        MaterialApp(
          home: caso[0] == 7
              ? DivisoresNumero(key: UniqueKey())
              : SumaDigitos(key: UniqueKey()),
        ),
      );
      await tester.enterText(find.byType(TextField), caso[1] as String);
      await tester.tap(find.text('Calcular'));
      await tester.pump();
      expect(find.text(caso[2] as String), findsOneWidget);
      await tester.enterText(find.byType(TextField), '0');
      await tester.tap(find.text('Calcular'));
      await tester.pump();
      expect(
        find.text('Ingrese un número entero positivo mayor que cero.'),
        findsOneWidget,
      );
      expect(find.text(caso[2] as String), findsNothing);
    }
  });
}
