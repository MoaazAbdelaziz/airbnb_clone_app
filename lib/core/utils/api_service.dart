import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response> get(String path, dynamic body) async {
    var response = await dio.get(
      path,
      data: body,
    );
    return response;
  }

  Future<Response> post(String path, dynamic body) async {
    var response = await dio.post(
      path,
      data: body,
    );
    return response;
  }

  Future<Response> delete(String path, dynamic body) async {
    var response = await dio.delete(
      path,
      data: body,
    );
    return response;
  }
}
