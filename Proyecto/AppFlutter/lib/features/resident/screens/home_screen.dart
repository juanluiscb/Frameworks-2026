import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/resident_provider.dart';
import '../../auth/providers/auth_provider.dart';
import '../../access/screens/guest_list_screen.dart';
import '../../payments/screens/payment_registration_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ResidentProvider>().fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final residentProvider = context.watch<ResidentProvider>();
    final authProvider = context.read<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Residencia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => authProvider.logout(),
          ),
        ],
      ),
      body: residentProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.person, size: 40),
                      title: Text('${residentProvider.resident?.usuario} ${residentProvider.resident?.nombreCompleto}'),
                      subtitle: Text('Casa: ${residentProvider.house?.numeroExterior} - ${residentProvider.house?.calle}'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('Gestión', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _MenuButton(
                          icon: Icons.qr_code,
                          label: 'Invitados',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const GuestListScreen()),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _MenuButton(
                          icon: Icons.payment,
                          label: 'Pagos',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const PaymentRegistrationScreen()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: Colors.indigo.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.indigo),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Colors.indigo),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
