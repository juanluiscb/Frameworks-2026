import 'package:flutter/material.dart';
import '../../../core/api/api_service.dart';
import '../models/resident_model.dart';

class ResidentProvider extends ChangeNotifier {
  Resident? _resident;
  House? _house;
  bool _isLoading = false;

  Resident? get resident => _resident;
  House? get house => _house;
  bool get isLoading => _isLoading;

  Future<void> fetchProfile() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await apiService.dio.get('residentes/');
      
      Map<String, dynamic> data;
      if (response.data is List) {
        if ((response.data as List).isNotEmpty) {
          data = response.data[0];
          print(data);
        } else {
          debugPrint('La lista del residente esta vacia.');
          return;
        }
      } else {
        data = response.data;
      }

      _resident = Resident.fromJson(data);

      if (_resident?.casaDetalle != null) {
        _house = _resident!.casaDetalle;
      } else if (_resident?.casaId != null) {
        try {
          final houseResponse = await apiService.dio.get('casas/${_resident!.casaId}/');
          _house = House.fromJson(houseResponse.data);
        } catch (e) {
          debugPrint('Error al obtener los detalles de la casa: $e');
        }
      }
    } catch (e) {
      debugPrint('Error al obtener los datos del perfil: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
