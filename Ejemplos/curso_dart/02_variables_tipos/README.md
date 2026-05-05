# Módulo 2: Variables y Tipos de Datos

En Dart, todo es un objeto. Veremos cómo declarar variables y los tipos de datos más comunes.

## Tipos de Declaración
- `var`: El tipo se infiere automáticamente (inferencia de tipos).
- `final`: La variable se puede asignar una sola vez y se inicializa al ejecutarse.
- `const`: La variable es una constante en tiempo de compilación.

## Tipos de Datos Básicos
- `int`: Números enteros (ej. 10, -5).
- `double`: Números con decimales (ej. 3.14, 2.0).
- `String`: Cadenas de texto (ej. "Hola").
- `bool`: Valores lógicos (`true` o `false`).

## Interpolación de Strings
Puedes incluir variables dentro de un texto usando el símbolo `$`:
```dart
print("Mi edad es $edad");
```

## Ejecución
```bash
dart run main.dart
```
