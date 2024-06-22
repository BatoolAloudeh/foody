import 'package:app1/constant/constantKey/key.dart';
import 'package:app1/network/local/cacheHelper.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL_API,
        receiveDataWhenStatusError: true,

      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        const String LOGIN = 'https://api.dev4.gomaplus.tech/api/loginEmployee';
        if(options.path!=LOGIN){
          // Do something before request is sent
          final token = CacheHelper.getData(key: TOKENKEY);
          options.headers['authorization'] = 'Bearer $token';}

        return handler.next(options); //continue
      },
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic> ?query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
        required Map<String, dynamic> data,
        Map<String, dynamic>? query,
        Options? options}) async {
    return await dio.post(url,
        data: data, queryParameters: query, options: options);
  }

  static Future<Response> postFormData(
      {required String url,
        required FormData formData,
        Map<String, dynamic>? query,
        Options? options}) async {
    return await dio.post(url,
        data: formData, queryParameters: query, options: options);
  }


  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    return await dio.put(url,
        data: data, queryParameters: query, options: options);
  }
}
