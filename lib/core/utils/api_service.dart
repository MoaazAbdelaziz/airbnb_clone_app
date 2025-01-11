import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get(String path) async {
    var response = await _dio.get(
      path,
    );
    return response;
  }

  Future<Response> post(String path, dynamic body) async {
    var response = await _dio.post(
      path,
      data: body,
    );
    return response;
  }

  Future<Response> delete(String path, dynamic body) async {
    var response = await _dio.delete(
      path,
      data: body,
    );
    return response;
  }
}
