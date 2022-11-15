import 'dart:async';

import 'package:flutter_tiger_app/models/api_response.dart';
import 'package:flutter_tiger_app/models/user.dart';
import 'package:flutter_tiger_app/network/common-api.dart';
import 'package:flutter_tiger_app/utilities/api_url.dart';

class AuthApi {
  Future<User> signIn(String email, String password) async {
    var c = Completer<User>();
    try {
      var jsonData = await CommonApi.instance.dio.post(
        ApiUrl.LOGIN,
        data: {'email': email, 'password': password},
      );
      print(jsonData.data);
      
      var objRes = ApiResponse<User>.fromJson(jsonData.data, (data) => User.fromJson(data));
      c.complete(objRes.data);
    } catch (e) {
      c.completeError(e);
    }

    return c.future;
  }

  Future<int> register(String email) async {
    var c = Completer<int>();
    try {
      var response = await CommonApi.instance.dio.post(
        ApiUrl.REGISTER,
        data: {'email': email},
      );

      var result = response.data['data'];
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }

    return c.future;
  }

  Future<User> verifyOtp(String email, String otp) async {
    var c = Completer<User>();
    try {
      var response = await CommonApi.instance.dio.post(
        ApiUrl.VERIFY_OTP,
        data: {'email': email, 'otp': otp},
      );

      var result = User.fromJson(response.data['data']);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }

    return c.future;
  }

  Future<User> refreshToken(String refreshToken) async {
    var c = Completer<User>();
    try {
      var response = await CommonApi.instance.dio.post(
        ApiUrl.REFRESH_TOKEN,
        data: {'refresh_token': refreshToken},
      );

      var result = User.fromJson(response.data['data']);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }

    return c.future;
  }

}
