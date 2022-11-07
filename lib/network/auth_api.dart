import 'dart:async';

import 'package:flutter_tiger_app/models/user.dart';
import 'package:flutter_tiger_app/network/common-api.dart';

class AuthApi {
  Future<User> signIn(String email, String password) async {
    var c = Completer<User>();
    try {
      var response = await CommonApi.instance.dio.post(
        '/api/v1/auth/login',
        data: {'email': email, 'password': password},
      );

      print(response);
      var result = User.fromJson(response.data['data']);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }

    return c.future;
  }

  Future<int> register(String email) async {
    var c = Completer<int>();
    try {
      var response = await CommonApi.instance.dio.post(
        '/api/v1/auth/register',
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
        '/api/v1/auth/verify-otp',
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
        '/api/v1/auth/refresh-token',
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
