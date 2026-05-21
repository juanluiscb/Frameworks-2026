import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/access_provider.dart';
import '../../resident/providers/resident_provider.dart';
import 'guest_qr_screen.dart';

class GuestListScreen extends StatefulWidget {
  const GuestListScreen({super.key});

  @override
  State<GuestListScreen> createState() => _GuestListScreenState();
}

class _GuestListScreenState extends State<GuestListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AccessProvider>().fetchGuests();
    });
  }

  @override
  Widget build(BuildContext context) {
    final accessProvider = context.watch<AccessProvider>();
    final residentId = context.read<ResidentProvider>().resident?.id;

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Invitados')),
      body: accessProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: accessProvider.guests.length,
              itemBuilder: (context, index) {
                final guest = accessProvider.guests[index];
                return ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: Text(guest.nombreCompleto),
                  subtitle: Text('Visita: ${guest.fechaVisita}'),
                  trailing: const Icon(Icons.qr_code),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => GuestQrScreen(guest: guest)),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateInvitationDialog(context, residentId),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateInvitationDialog(BuildContext context, int? residentId) {
    if (residentId == null) return;
    final nameController = TextEditingController();
    final dateController = TextEditingController(
      text: DateTime.now().toIso8601String().split('T').first,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nueva Invitación'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Nombre Completo')),
            TextField(controller: dateController, decoration: const InputDecoration(labelText: 'Fecha (YYYY-MM-DD)')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              final success = await context.read<AccessProvider>().createInvitation(
                residentId,
                nameController.text,
                dateController.text,
              );
              if (!mounted) return;
              if (success) Navigator.pop(context);
            },
            child: const Text('Crear'),
          ),
        ],
      ),
    );
  }
}
