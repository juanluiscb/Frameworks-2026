import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const HttpApp());

class HttpApp extends StatelessWidget {
  const HttpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListaUsuarios(),
    );
  }
}

class ListaUsuarios extends StatefulWidget {
  const ListaUsuarios({super.key});

  @override
  State<ListaUsuarios> createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  // Future representa un valor que estará disponible en el futuro.
  late Future<List<dynamic>> _usuarios;

  @override
  void initState() {
    super.initState();
    _usuarios = _obtenerUsuarios();
  }

  Future<List<dynamic>> _obtenerUsuarios() async {
    // Realizamos la petición GET a la API.
    // NOTA: Recuerda añadir 'http: ^1.1.0' en tu pubspec.yaml para probar este código.
    final respuesta = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (respuesta.statusCode == 200) {
      return jsonDecode(respuesta.body);
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Peticiones HTTP (API)')),
      body: FutureBuilder<List<dynamic>>(
        future: _usuarios,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras carga, mostramos un indicador de progreso.
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Cuando los datos están listos, construimos la lista.
            final datos = snapshot.data!;
            return ListView.builder(
              itemCount: datos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(datos[index]['name']),
                  subtitle: Text(datos[index]['email']),
                  leading: const Icon(Icons.person),
                );
              },
            );
          }
        },
      ),
    );
  }
}
