import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// NOTA: Recuerda añadir 'provider: ^6.1.1' en tu pubspec.yaml para probar este código.

void main() {
  runApp(
    // ChangeNotifierProvider envuelve la app para que el estado sea accesible desde cualquier widget.
    ChangeNotifierProvider(
      create: (context) => ContadorModelo(),
      child: const ProviderApp(),
    ),
  );
}

// 1. El Modelo que contiene el estado y notifica cambios.
class ContadorModelo extends ChangeNotifier {
  int _valor = 0;
  int get valor => _valor;

  void incrementar() {
    _valor++;
    notifyListeners(); // Notifica a los widgets que deben redibujarse.
  }
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Contador compartido entre widgets:', style: TextStyle(fontSize: 18)),
              ContadorTexto(),
              SizedBox(height: 20),
              BotonIncrementar(),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. Un widget que CONSUME el estado.
class ContadorTexto extends StatelessWidget {
  const ContadorTexto({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos context.watch para escuchar cambios.
    final contador = context.watch<ContadorModelo>();
    return Text(
      '${contador.valor}',
      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
    );
  }
}

// 3. Un widget que MODIFICA el estado.
class BotonIncrementar extends StatelessWidget {
  const BotonIncrementar({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Usamos context.read para ejecutar una acción sin redibujar este widget innecesariamente.
      onPressed: () => context.read<ContadorModelo>().incrementar(),
      child: const Text('Incrementar desde aquí'),
    );
  }
}
