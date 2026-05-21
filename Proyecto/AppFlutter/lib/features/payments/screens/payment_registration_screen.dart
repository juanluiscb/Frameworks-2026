import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/payment_provider.dart';
import '../../resident/providers/resident_provider.dart';

class PaymentRegistrationScreen extends StatefulWidget {
  const PaymentRegistrationScreen({super.key});

  @override
  State<PaymentRegistrationScreen> createState() => _PaymentRegistrationScreenState();
}

class _PaymentRegistrationScreenState extends State<PaymentRegistrationScreen> {
  final _amountController = TextEditingController();
  final _monthController = TextEditingController();
  File? _image;
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final paymentProvider = context.watch<PaymentProvider>();
    final residentId = context.read<ResidentProvider>().resident?.id;

    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Pago')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Monto (\$)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _monthController,
              decoration: const InputDecoration(labelText: 'Mes (ej: Mayo 2026)'),
            ),
            const SizedBox(height: 24),
            _image == null
                ? const Text('No hay comprobante seleccionado')
                : Image.file(_image!, height: 200),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.image),
              label: const Text('Seleccionar Comprobante'),
            ),
            const SizedBox(height: 32),
            paymentProvider.isUploading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      if (_image == null || residentId == null) return;
                      final success = await paymentProvider.registerPayment(
                        residenteId: residentId,
                        monto: double.parse(_amountController.text),
                        mes: _monthController.text,
                        comprobante: _image!,
                      );
                      if (!mounted) return;
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Pago registrado exitosamente')),
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Enviar Registro'),
                  ),
          ],
        ),
      ),
    );
  }
}
