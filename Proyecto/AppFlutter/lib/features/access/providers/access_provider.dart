import 'package:flutter/material.dart';
import 'package:otp/otp.dart';
import '../../../core/api/api_service.dart';
import '../models/guest_model.dart';

class AccessProvider extends ChangeNotifier {
  List<Guest> _guests = [];
  bool _isLoading = false;

  List<Guest> get guests => _guests;
  bool get isLoading => _isLoading;

  Future<void> fetchGuests() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await apiService.dio.get('invitados/');
      _guests = (response.data as List).map((e) => Guest.fromJson(e)).toList();
    } catch (e) {
      debugPrint('Error fetching guests: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createInvitation(int residenteId, String nombre, String fecha) async {
    try {
      final response = await apiService.dio.post('invitados/', data: {
        'residente': residenteId,
        'nombre_completo': nombre,
        'fecha_visita': fecha,
      });
      if (response.statusCode == 201) {
        await fetchGuests();
        return true;
      }
    } catch (e) {
      debugPrint('Error creating invitation: $e');
    }
    return false;
  }

  String generateTotp(String qrUri) {
    try {
      final uri = Uri.parse(qrUri);
      final secret = uri.queryParameters['secret'];
      if (secret == null) return '000000';
      
      return OTP.generateTOTPCodeString(
        secret,
        DateTime.now().millisecondsSinceEpoch,
        interval: 30,
        algorithm: Algorithm.SHA1,
        isGoogle: true,
      );
    } catch (e) {
      debugPrint('Error generating TOTP: $e');
      return '000000';
    }
  }
}
