import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../providers/access_provider.dart';
import '../models/guest_model.dart';

class GuestQrScreen extends StatefulWidget {
  final Guest guest;
  const GuestQrScreen({super.key, required this.guest});

  @override
  State<GuestQrScreen> createState() => _GuestQrScreenState();
}

class _GuestQrScreenState extends State<GuestQrScreen> {
  late Timer _timer;
  late String _totp;

  @override
  void initState() {
    super.initState();
    _updateTotp();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (DateTime.now().second % 30 == 0) {
        setState(() {
          _updateTotp();
        });
      }
    });
  }

  void _updateTotp() {
    _totp = context.read<AccessProvider>().generateTotp(widget.guest.qrUri);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final qrData = "CAS-${widget.guest.id}-$_totp";

    return Scaffold(
      appBar: AppBar(title: const Text('Acceso de Invitado')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.guest.nombreCompleto, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Válido para: ${widget.guest.fechaVisita}'),
            const SizedBox(height: 32),
            QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 250.0,
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 32),
            const Text('Código Dinámico:', style: TextStyle(color: Colors.grey)),
            Text(_totp, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 8)),
            const SizedBox(height: 16),
            const Text('El QR se actualiza cada 30 segundos', style: TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
