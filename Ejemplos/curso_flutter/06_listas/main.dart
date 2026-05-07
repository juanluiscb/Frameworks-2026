import 'package:flutter/material.dart';

void main() => runApp(const ListasApp());

class ListasApp extends StatelessWidget {
  const ListasApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Generamos una lista de 50 elementos para el ejemplo.
    final items = List<String>.generate(50, (i) => "Elemento número $i");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Listas con ListView')),
        body: ListView.builder(
          // itemCount define cuántos elementos tiene la lista.
          itemCount: items.length,
          // itemBuilder se encarga de construir cada fila de la lista de forma eficiente.
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.label),
              title: Text(items[index]),
              subtitle: Text('Subtítulo del elemento $index'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () {
                // Acción al tocar un elemento de la lista
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tocaste el ${items[index]}')),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
