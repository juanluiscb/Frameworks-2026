void main() {
  // 1. Variable que NO puede ser nula
  String ciudad = 'Madrid';
  // ciudad = null; // Esto daría un error de compilación

  // 2. Variable que PUEDE ser nula usando '?'
  String? nombreUsuario;
  print('Usuario actual: $nombreUsuario'); // Imprime null

  // 3. Asignar un valor por defecto usando '??'
  String saludo = nombreUsuario ?? 'Invitado';
  print('Hola, $saludo');

  // 4. Llamadas seguras usando '?.'
  // Si nombreUsuario es null, no intenta llamar a toUpperCase() y devuelve null
  print('Mayúsculas: ${nombreUsuario?.toUpperCase()}');

  nombreUsuario = 'Carlos';
  print('Usuario actualizado: $nombreUsuario');
  print('Mayúsculas ahora: ${nombreUsuario.toUpperCase()}');
}
