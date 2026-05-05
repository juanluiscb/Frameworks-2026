void main() {
  // 1. Declaración con inferencia de tipos
  var nombre = 'Juan'; // Dart sabe que es un String
  
  // 2. Tipos explícitos
  int edad = 45;
  double estatura = 1.72;
  bool esEstudiante = false;
  
  // 3. Final y Const
  final DateTime fechaActual = DateTime.now(); // Se asigna en tiempo de ejecución
  const double pi = 3.1415926535897932384626; // Se asigna en tiempo de compilación
  
  // Imprimiendo con interpolación de Strings
  print('Nombre: $nombre');
  print('Edad: $edad años');
  print('Estatura: $estatura m');
  print('¿Es estudiante?: $esEstudiante');
  print('Fecha de hoy: $fechaActual');
  print('Valor de PI: $pi');
  
  // Ejemplo de cambio de valor
  nombre += ' Luis' ;
  print('Nombre actualizado: $nombre');
}
