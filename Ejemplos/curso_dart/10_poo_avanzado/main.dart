void main() {
  print('--- Ejemplo de Herencia y Polimorfismo ---');

  // No podemos crear un 'Animal' directamente porque es abstracta
  // final animal = Animal('Genérico'); // Esto daría error

  // Creamos instancias de las clases hijas
  final miPerro = Perro('Fido');
  final miGato = Gato('Michi');

  // Polimorfismo en acción: 
  // Creamos una lista de tipo 'Animal' que contiene diferentes tipos de animales
  List<Animal> misMascotas = [miPerro, miGato];

  // Recorremos la lista y cada animal hace su sonido específico
  for (var animal in misMascotas) {
    print('El animal ${animal.nombre} dice:');
    animal.hacerSonido(); // Polimorfismo: cada objeto sabe cómo "hacerSonido"
  }
}

// 1. Clase Abstracta: Define el "contrato"
abstract class Animal {
  String nombre;

  Animal(this.nombre);

  // Método abstracto: las hijas están obligadas a implementarlo
  void hacerSonido();

  // Método concreto: las hijas lo heredan tal cual
  void dormir() {
    print('$nombre está durmiendo...');
  }
}

// 2. Herencia: Perro hereda de Animal
class Perro extends Animal {
  // Constructor: usa 'super' para pasar el nombre a la clase Animal
  Perro(String nombre) : super(nombre);

  // Sobrescritura: personalizamos el sonido del perro
  @override
  void hacerSonido() {
    print('¡Guau! 🐶');
  }
}

// 3. Herencia: Gato hereda de Animal
class Gato extends Animal {
  Gato(String nombre) : super(nombre);

  @override
  void hacerSonido() {
    print('¡Miau! 🐱');
  }
}
