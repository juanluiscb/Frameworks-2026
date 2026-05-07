import 'package:flutter/material.dart';

void main() => runApp(const WidgetsBasicosApp());

class WidgetsBasicosApp extends StatelessWidget {
  const WidgetsBasicosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Widgets Básicos')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Widget Text: Para mostrar cadenas de texto
              const Text(
                'Hola, soy un Text con estilo',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20), // Espaciador

              // 2. Widget Icon: Para mostrar iconos predefinidos
              const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 50.0,
              ),
              const SizedBox(height: 20),

              // 3. Widget Container: Es como un <div> en HTML, permite dar estilo
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                child: const Text('Soy un Container con sombra'),
              ),
              const SizedBox(height: 20),

              // 4. Widget Image: Para mostrar imágenes (NetworkImage usa una URL)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://picsum.photos/250/150',
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
