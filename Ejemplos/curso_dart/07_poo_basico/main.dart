void main() {
  // Crear una instancia de la clase Persona
  final persona1 = Persona('Juan', 28);
  
  // Usar sus atributos y métodos
  print('Persona: ${persona1.nombre}');
  persona1.presentarse();
  
  // Crear otra instancia
  final persona2 = Persona('María', 24);
  persona2.presentarse();
}

class Persona {
  // Atributos
  String nombre;
  int edad;

  // Constructor (Forma corta de Dart)
  Persona(this.nombre, this.edad);

  // Método
  void presentarse() {
    print('Hola, mi nombre es $nombre y tengo $edad años.');
  }
}
