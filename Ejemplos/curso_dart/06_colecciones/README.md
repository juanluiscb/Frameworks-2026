# Módulo 6: Colecciones

Dart ofrece formas potentes de agrupar y manejar conjuntos de datos.

## 1. Listas (List)
Colecciones ordenadas de elementos. Permiten duplicados.
```dart
List<String> frutas = ['Manzana', 'Pera'];
```

## 2. Conjuntos (Set)
Colecciones de elementos únicos. No permiten duplicados.
```dart
Set<String> paises = {'España', 'México', 'España'}; // Solo guardará uno de cada uno
```

## 3. Mapas (Map)
Pares de llave-valor (como diccionarios en otros lenguajes).
```dart
Map<String, dynamic> usuario = {'nombre': 'Juan', 'id': 1};
```

## Ejecución
```bash
dart run main.dart
```
