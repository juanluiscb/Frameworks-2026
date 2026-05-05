void main() {
  print('--- LISTAS ---');
  List<String> supervillanos = ['Lex Luthor', 'Joker', 'Magneto'];
  supervillanos.add('Thanos');
  print('Lista: $supervillanos');
  print('Primer villano: ${supervillanos[0]}');

  print('\n--- CONJUNTOS (SETS) ---');
  Set<String> villanosUnicos = {'Lex Luthor', 'Joker', 'Lex Luthor','Mosquito','Joker'}; 
  print('Set (sin duplicados): $villanosUnicos');

  print('\n--- MAPAS ---');
  Map<String, dynamic> heroe = {
    'nombre': 'Tony Stark',
    'alias': 'Iron Man',
    'nivel': 100,
    'activo': true
  };
  print('Mapa: $heroe');
  print('Nombre del héroe: ${heroe['nombre']}');
  
  // Agregar un valor nuevo al mapa
  heroe['ciudad'] = 'Nueva York';
  print('Mapa actualizado: $heroe');
}
