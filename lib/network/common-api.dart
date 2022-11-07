import 'package:dio/dio.dart';
import 'package:flutter_tiger_app/network/auth_api.dart';
import 'package:flutter_tiger_app/shared/spref.dart';

class CommonApi {
  static BaseOptions _options = BaseOptions(
    baseUrl: "http://localhost:9090",
    connectTimeout: 5000,
    receiveTimeout: 5000
  );

  Dio dio = Dio(_options);

  CommonApi._internal() {
    dio.interceptors
        .add(InterceptorsWrapper(
        onRequest:(options, handler) async {
          // Do something before request is sent
          var token = await SPref.instance.get("accessToken");
          if (token != null) {
            print(token);
            options.headers["Authorization"] = "Bearer " + token;
          }

          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onResponse:(response,handler) {
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onError: (DioError error, handler) async {
          if (error.response?.statusCode == 403 ||
              error.response?.statusCode == 401) {
            await refreshToken();
            final cloneReq = await _retry(error.requestOptions);
            return handler.resolve(cloneReq);
          }

          return handler.next(error);
        }
    ));
  }

  Future<void> refreshToken() async {
    final refreshToken = await SPref.instance.get("refreshToken");
    await AuthApi().refreshToken(refreshToken);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return await CommonApi.instance.dio.request<void>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  static CommonApi instance = CommonApi._internal();
}