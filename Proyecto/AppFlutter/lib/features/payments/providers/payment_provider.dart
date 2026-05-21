import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../core/api/api_service.dart';

class PaymentProvider extends ChangeNotifier {
  bool _isUploading = false;
  bool get isUploading => _isUploading;

  Future<bool> registerPayment({
    required int residenteId,
    required double monto,
    required String mes,
    required File comprobante,
  }) async {
    _isUploading = true;
    notifyListeners();

    try {
      String fileName = comprobante.path.split('/').last;
      FormData formData = FormData.fromMap({
        "residente": residenteId,
        "monto": monto,
        "mes_correspondiente": mes,
        "comprobante": await MultipartFile.fromFile(
          comprobante.path,
          filename: fileName,
        ),
      });

      final response = await apiService.dio.post(
        'pagos/',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      debugPrint('Error registering payment: $e');
      return false;
    } finally {
      _isUploading = false;
      notifyListeners();
    }
  }
}
