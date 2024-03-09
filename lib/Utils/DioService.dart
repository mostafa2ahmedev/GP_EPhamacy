import 'package:dio/dio.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit.dart';
import 'package:gppharmacy/Utils/Constant.dart';

class DioService {
  static late Dio dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constant.BasURL,

        receiveDataWhenStatusError:
            true, //بقوله هات الداتا حتي لو حصل ايرور وهي راجعه
      ),
    );
  }

  static Future<Response> getDate(
      {required String url,
      Map<String, dynamic>? query,
      required String token}) async {
    return await dio.get(
      url,
      queryParameters: query,
      options: Options(
        headers: {"authorization": 'Bearer $token'},
      ),
    );
  }

  static Future<Response> signIn(
      {required String url, required Map<String, dynamic> data}) async {
    return await dio.post(url, data: data);
  }
}
