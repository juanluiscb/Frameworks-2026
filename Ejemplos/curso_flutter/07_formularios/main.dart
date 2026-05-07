import 'package:flutter/material.dart';

void main() => runApp(const FormularioApp());

class FormularioApp extends StatelessWidget {
  const FormularioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Formularios y Validación')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: MiFormulario(),
        ),
      ),
    );
  }
}

class MiFormulario extends StatefulWidget {
  const MiFormulario({super.key});

  @override
  MiFormularioState createState() => MiFormularioState();
}

class MiFormularioState extends State<MiFormulario> {
  // GlobalKey se usa para identificar el formulario y validar sus campos.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: '¿Cómo te llamas?',
              labelText: 'Nombre *',
            ),
            // La función validator comprueba si el texto ingresado es correcto.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu nombre';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Si el formulario es válido, mostramos un aviso.
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Procesando datos...')),
                  );
                }
              },
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}
