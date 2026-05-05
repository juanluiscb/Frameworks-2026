# Módulo 5: Funciones

Las funciones permiten reutilizar bloques de código.

## Estructura de una Función
```dart
tipoRetorno nombreFuncion(tipoParametro parametro) {
  // código
  return valor;
}
```

## Tipos de Parámetros
1. **Posicionales**: Se pasan en el orden definido.
2. **Nombrados**: Se usan llaves `{}` y el nombre del parámetro al llamar la función.
3. **Opcionales**: Se usan corchetes `[]` para parámetros posicionales opcionales.

## Funciones de Flecha (Arrow Functions)
Para funciones de una sola línea:
```dart
int sumar(int a, int b) => a + b;
```

## Ejecución
```bash
dart run main.dart
```
