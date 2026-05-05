# Módulo 10: POO Avanzado - Herencia y Polimorfismo

En este módulo profundizaremos en la Programación Orientada a Objetos, aprendiendo cómo reutilizar código y cómo hacer que diferentes objetos respondan a la misma instrucción de formas distintas.

## 1. Herencia (`extends`)
La herencia permite que una clase (hija) adquiera las propiedades y métodos de otra clase (padre).
- Se usa la palabra reservada `extends`.
- La clase hija puede usar `super` para llamar al constructor o métodos del padre.

## 2. Clases Abstractas (`abstract`)
Son clases que no se pueden instanciar directamente. Sirven como un "plano" o contrato para otras clases. Suelen definir métodos sin cuerpo que las clases hijas **deben** implementar.

## 3. Polimorfismo
Es la capacidad de tratar a objetos de diferentes clases de la misma manera si comparten una base común. Por ejemplo, tratar a un `Perro` y a un `Gato` simplemente como un `Animal`.

## 4. Sobrescritura de Métodos (`@override`)
Las clases hijas pueden redefinir el comportamiento de un método heredado para adaptarlo a sus necesidades.

## Ejecución
```bash
dart run main.dart
```
