# Módulo 8: Null Safety (Seguridad Nula)

Null Safety evita errores comunes donde intentamos acceder a algo que es `null`.

## Conceptos Fundamentales
1. **No-Nulo por defecto**: Las variables no pueden ser null a menos que lo especifiques.
2. **Operador `?`**: Indica que una variable PUEDE ser null.
   ```dart
   String? nombre;
   ```
3. **Operador `!`**: Asegura a Dart que el valor NO es null (úsalo con precaución).
4. **Operador `??`**: Provee un valor por defecto si algo es null.
   ```dart
   String saludo = nombre ?? 'Invitado';
   ```

## Ejecución
```bash
dart run main.dart
```
