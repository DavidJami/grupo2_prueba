# Grupo 2: ejercicios con números

Aplicación desarrollada con Flutter y Dart para la materia Desarrollo de Aplicaciones Móviles.

## Ejercicios

- **7. Divisores:** muestra los divisores positivos de un número y su cantidad.
- **8. Inversión:** invierte los dígitos de un número entero positivo.
- **9. Suma de dígitos:** suma los dígitos e indica si la suma es par o impar.

Incluye un menú principal, validación de entrada y un botón para limpiar cada formulario. Admite enteros positivos de hasta nueve dígitos. Al invertir un número, los ceros iniciales del resultado no se conservan: 120 produce 21.

## Organización

Los archivos están directamente en `lib`, separados por pantalla, sin MVC ni Atomic Design:

- `main.dart`: inicio y tema de la aplicación.
- `menu_ejercicios.dart`: pantalla principal y navegación.
- `divisores_numero.dart`: pantalla y cálculo de divisores.
- `inversion_numero.dart`: pantalla y cálculo de inversión.
- `suma_digitos.dart`: pantalla y cálculo de suma y paridad.

## Ejecución

Con Flutter instalado y un dispositivo o navegador disponible:

```sh
flutter pub get
flutter run
```

## Comprobaciones

```sh
flutter analyze
flutter test
```

## Ejemplos

| Ejercicio | Entrada | Resultado |
|---|---|---|
| Divisores | 12 | 1, 2, 3, 4, 6, 12; cantidad: 6 |
| Inversión | 123 | 321 |
| Suma de dígitos | 123 | 6, par |
| Suma de dígitos | 12 | 3, impar |
