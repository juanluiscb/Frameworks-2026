import 'package:flutter/material.dart';

void main() => runApp(const LayoutsApp());

class LayoutsApp extends StatelessWidget {
  const LayoutsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Layouts: Columna, Renglón y pila')),
        body: SingleChildScrollView(
          // Permite hacer scroll si el contenido es muy largo
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('1. Column (Vertical)', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              // Column organiza sus hijos de arriba a abajo
              Container(
                color: Colors.blue[50],
                width: double.infinity,
                child: const Column(
                  children: [
                    Icon(Icons.star, size: 40),
                    Icon(Icons.square, size: 40),
                    Icon(Icons.policy, size: 40),
                    Icon(Icons.traffic, size: 40),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('2. Row (Horizontal)', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              // Row organiza sus hijos de izquierda a derecha
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(backgroundColor: Colors.red, radius: 20),
                  CircleAvatar(backgroundColor: Colors.green, radius: 20),
                  CircleAvatar(backgroundColor: Colors.blue, radius: 20),
                  CircleAvatar(backgroundColor: Colors.yellow, radius: 20),
                ],
              ),

              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('3. Stack (Superpuestos)', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              // Stack permite poner widgets uno encima de otro
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(width: 150, height: 150, color: Colors.purple),
                  Container(width: 100, height: 100, color: Colors.purpleAccent),
                  Container(width: 50, height: 50, color: Colors.redAccent),
                  const Text('ENCIMA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
