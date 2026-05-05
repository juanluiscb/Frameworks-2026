void main() {
  int edad = 18;

  print('--- IF / ELSE ---');
  if (edad >= 18) {
    print('Eres mayor de edad.');
  }else {
    print('Eres menor de edad.');
  }

  print('\n--- SWITCH ---');
  String dia = 'Martes';
  switch (dia) {
    case 'Lunes':
      print('Comienzo de semana.');
      break;
    case 'Martes':
      print('Clase de Frameworks!!!');
      break;
    case 'Viernes':
      print('Casi fin de semana.');
      break;
    default:
      print('Día normal.');
  }

  print('\n--- Bucle FOR ---');
  for (int i = 1; i <= 5; i++) {
    print('Contador: $i');
  }

  print('\n--- Bucle WHILE ---');
  int contador = 3;
  while (contador > 0) {
    print('Cuenta regresiva: $contador');
    contador--;
  }
}
