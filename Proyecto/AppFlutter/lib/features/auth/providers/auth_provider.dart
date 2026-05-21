import 'package:flutter/material.dart';
import '../../../core/api/api_service.dart';
import '../../../core/storage/token_storage.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await apiService.dio.post('token/', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        await TokenStorage.saveTokens(
          response.data['access'],
          response.data['refresh'],
        );
        _isAuthenticated = true;
        return true;
      }
    } catch (e) {
      debugPrint('Login error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return false;
  }

  Future<void> logout() async {
    await TokenStorage.clearTokens();
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> checkAuth() async {
    final token = await TokenStorage.getAccessToken();
    if (token != null) {
      _isAuthenticated = true;
      notifyListeners();
    }
  }
}
