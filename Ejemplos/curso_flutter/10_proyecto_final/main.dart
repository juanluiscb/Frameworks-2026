import 'package:flutter/material.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Lista de Tareas',
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // Lista de tareas (estado de nuestra aplicación)
  final List<String> _tareas = [];
  final TextEditingController _controller = TextEditingController();

  void _agregarTarea() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tareas.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _eliminarTarea(int index) {
    setState(() {
      _tareas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📝 Mis Tareas Pendientes'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Escribe una nueva tarea...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: _agregarTarea,
                  icon: const Icon(Icons.add_circle, size: 40, color: Colors.teal),
                ),
              ],
            ),
          ),
          Expanded(
            child: _tareas.isEmpty
                ? const Center(child: Text('No hay tareas. ¡Añade una!'))
                : ListView.builder(
                    itemCount: _tareas.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: ListTile(
                          title: Text(_tareas[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _eliminarTarea(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
