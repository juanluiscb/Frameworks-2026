import 'package:flutter/material.dart';

void main() {
  // runApp es el punto de partida de toda aplicación Flutter.
  // Recibe un Widget que será la raíz de nuestra aplicación.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp es un widget que configura el diseño visual de la app
    // basándose en las guías de Material Design de Google.
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita el banner de "debug"
      home: Scaffold(
        // Scaffold proporciona una estructura básica (barra superior, cuerpo, etc.)
        appBar: AppBar(
          title: const Text('Mi Primera App en Flutter'),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          // Center centra a su hijo tanto vertical como horizontalmente
          child: Text(
            '¡Hola Mundo!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
