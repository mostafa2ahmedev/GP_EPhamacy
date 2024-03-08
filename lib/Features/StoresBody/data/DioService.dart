import 'package:dio/dio.dart';

class DioService {
  static late Dio dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError:
            true, //بقوله هات الداتا حتي لو حصل ايرور وهي راجعه
      ),
    );
  }

  static Future<Response> getDate(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
