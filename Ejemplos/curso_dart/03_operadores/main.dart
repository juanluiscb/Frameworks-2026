void main() {
  int a = 10;
  int b = 3;

  print('--- Operadores Aritméticos ---');
  print('Suma: $a + $b = ${a + b}');
  print('Resta: $a - $b = ${a - b}');
  print('Multiplicación: $a * $b = ${a * b}');
  print('División: $a / $b = ${a / b}');
  print('División Entera: $a ~/ $b = ${a ~/ b}');
  print('Residuo: $a % $b = ${a % b}');

  print('\n--- Operadores Relacionales ---');
  print('$a == $b: ${a == b}');
  print('$a != $b: ${a != b}');
  print('$a > $b: ${a > b}');
  print('$a < $b: ${a < b}');

  print('\n--- Operadores Lógicos ---');
  bool esAdulto = true;
  bool tieneLicencia = false;
  print('¿Puede conducir?: ${esAdulto && tieneLicencia}');
  print('¿Tiene alguna condición?: ${esAdulto || tieneLicencia}');
  print('Lo opuesto de esAdulto: ${!esAdulto}');
}
