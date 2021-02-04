import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/application/app_api.dart';
import 'package:flutter_app/application/classes/errors/common_error.dart';
import 'package:flutter_app/application/storage/local_storage.dart';
import 'package:flutter_app/application/storage/storage_keys.dart';

abstract class AuthRepisotory {
  Future signIn({
    @required String email,
    @required String password,
  });
  Future signUp({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required String passwordConfirmation,
  });
}

class AuthRepositoryImpl implements AuthRepisotory {
  @override
  Future signIn({String email, String password}) async {
    try {
      var response = await AppApi.dio.post(
        "/api/auth/login",
        data: {"email": email, "password": password},
      );
      String accessToken = response.data['accessToken'];
      String tokenType = response.data['tokenType'];
      String expiresAt = response.data['expiresAt'];
      print(accessToken);
      print(tokenType);
      print(expiresAt);

      await LocalStorage.setItem(TOKEN, accessToken);
      await LocalStorage.setItem(TOKEN_TYPE, tokenType);
      await LocalStorage.setItem(TOKEN_EXPIRATION, expiresAt);

      return;
    } on DioError catch (e) {
      print(e.response);
      showNetworkError(e);
    }
  }

  @override
  Future signUp({
    String firstName,
    String lastName,
    String email,
    String password,
    String passwordConfirmation,
  }) async {
    try {
      var response = await AppApi.dio.post(
        "/api/auth/register",
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation
        },
      );
      print(response);
    } on DioError catch (e) {
      print(e.response);
      showNetworkError(e);
    }
  }
}
