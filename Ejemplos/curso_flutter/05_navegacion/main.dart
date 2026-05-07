import 'package:flutter/material.dart';

void main() => runApp(const NavegacionApp());

class NavegacionApp extends StatelessWidget {
  const NavegacionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrimeraPantalla(),
    );
  }
}

class PrimeraPantalla extends StatelessWidget {
  const PrimeraPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Primera Pantalla')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Ir a la Segunda Pantalla'),
          onPressed: () {
            // Navigator gestiona una pila de pantallas.
            // push añade una nueva pantalla encima de la actual.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SegundaPantalla()),
            );
          },
        ),
      ),
    );
  }
}

class SegundaPantalla extends StatelessWidget {
  const SegundaPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda Pantalla')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            // pop elimina la pantalla actual y vuelve a la anterior.
            Navigator.pop(context);
          },
          child: const Text('Regresar'),
        ),
      ),
    );
  }
}
