import 'package:dio/dio.dart';
import '../storage/token_storage.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(
    // baseUrl: 'http://10.77.120.189/api/',
    baseUrl: 'http://10.77.120.189/api/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  ApiService() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await TokenStorage.getAccessToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final refreshToken = await TokenStorage.getRefreshToken();
          if (refreshToken != null) {
            try {
              final response = await Dio().post(
                'http://10.77.120.189/api/token/refresh/',
                data: {'refresh': refreshToken},
              );
              final newAccess = response.data['access'];
              await TokenStorage.saveTokens(newAccess, refreshToken);
              
              error.requestOptions.headers['Authorization'] = 'Bearer $newAccess';
              final retryResponse = await dio.fetch(error.requestOptions);
              return handler.resolve(retryResponse);
            } catch (e) {
              await TokenStorage.clearTokens();
            }
          }
        }
        return handler.next(error);
      },
    ));
  }
}

final apiService = ApiService();
