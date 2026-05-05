void main() async {
  print('Iniciando programa...');

  // Datos locales
  String local = obtenerDatosLocal();
  print('Datos locales: $local');

  // Esperamos el resultado de la función asíncrona
  String datos = await obtenerDatosDeInternet();
  print('Resultado: $datos');
  
  String local2 = obtenerDatosLocal2();
  print('Datos locales $local2');
  print('Fin del programa.');
}

// Simulamos una petición que tarda 2 segundos
Future<String> obtenerDatosDeInternet() async {
  print('Obteniendo datos... (espera 2 segundos)');
  
  return Future.delayed(Duration(seconds: 2), () {
    return 'Carga de datos exitosa: {id: 1, mensaje: "Hola desde la nube"}';
  });
}

// Simulamos la peticion de datos locales
String obtenerDatosLocal(){
  return 'Esto va primero';
}
String obtenerDatosLocal2(){
  return 'Esto va despues';
}