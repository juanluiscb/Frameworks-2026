import 'package:flutter/material.dart';

void main() => runApp(const InteractividadApp());

class InteractividadApp extends StatelessWidget {
  const InteractividadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContadorPagina(),
    );
  }
}

// Un StatefulWidget es un widget que puede cambiar su contenido durante la ejecución.
class ContadorPagina extends StatefulWidget {
  const ContadorPagina({super.key});

  @override
  State<ContadorPagina> createState() => _ContadorPaginaState();
}

class _ContadorPaginaState extends State<ContadorPagina> {
  int _contador = 0; // Variable de estado

  void _incrementar() {
    // setState le dice a Flutter que algo cambió y que debe redibujar la pantalla.
    setState(() {
      _contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatefulWidget e Interactividad')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Has presionado el botón tantas veces:'),
            Text(
              '$_contador',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _incrementar, // Acción al presionar
              icon: const Icon(Icons.add),
              label: const Text('Incrementar'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _contador = 0;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
