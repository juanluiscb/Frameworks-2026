# Módulo 9: Asincronía

La asincronía nos permite realizar tareas que toman tiempo (como pedir datos a internet) sin congelar el programa.

## Conceptos Clave
- **`Future`**: Representa un valor que estará disponible en el futuro.
- **`async`**: Marca una función como asíncrona.
- **`await`**: Espera a que un `Future` termine para continuar con la siguiente línea de código.

## Ejemplo de flujo
1. Llamas a una función asíncrona.
2. Usas `await` para esperar el resultado.
3. El programa sigue con el resto de la lógica cuando el dato llega.

## Ejecución
```bash
dart run main.dart
```
