import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static Dio? init() => dio = Dio(BaseOptions(
      baseUrl: "",
      receiveDataWhenStatusError: true));
  static Future<Response> getData(
          {required String path,
          Map<String, dynamic>? queryParameters = const {}}) async =>
      await dio!.get(path, queryParameters: queryParameters);
}
