void main() {
  saludar('Juan Luis'); // Llamada simple
  
  int resultado = sumar(5, 10);
  print('La suma es: $resultado');
  
  // Parámetros nombrados
  configurarUsuario(nombre: 'Ana', edad: 30);
  
  // Función flecha
  print('Multiplicación: ${multiplicar(4, 3)}');
}

// Función básica con parámetros posicionales
void saludar(String nombre) {
  print('Hola, $nombre!');
}

// Función que retorna un valor
int sumar(int a, int b) {
  return a + b;
}

// Parámetros nombrados (usando 'required' para obligatorios)
void configurarUsuario({required String nombre, int? edad}) {
  print('Configurando a $nombre de $edad años');
}

// Función lamda (Arrow function)
int multiplicar(int a, int b) => a * b;
