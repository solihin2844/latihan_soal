import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../data/konstanta.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserData?> getUserByEmail({required String email});

  Future<bool> registerUser({required UserData userBody});
}

class AuthRepositoryImpl implements AuthRepository {
  Dio _dio() {
    BaseOptions options = BaseOptions(
        baseUrl: Urls.baseUrl,
        headers: {
          //"x-api-key": Urls.apiKey,
          HttpHeaders.contentTypeHeader: "application/json"
        },
        responseType: ResponseType.json);
    final dio = Dio(options);
    return dio;
  }

  @override
  Future<UserData?> getUserByEmail({required String email}) async {
    try {
      final result = await _dio()
          .get('', queryParameters: {"minta": "user", "email": email});
      UserResponse res = UserResponse.fromJson(result.data);

      return res.data;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getUserByEmail: $e, $stackTrace');
      }
      return null;
    }
  }

  @override
  Future<bool> registerUser({required UserData userBody}) async {
    try {
      final result = await _dio().post('',
          queryParameters: {"action": "tambah_user"},
          data: userBody.toJson(),
          options: Options(
            followRedirects: false,
            validateStatus: (status) => status! < 400,
          ));

      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err registerUser: $e, $stackTrace');
      }
      return false;
    }
  }
}
