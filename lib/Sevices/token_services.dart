import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  Dio dio = Dio();

  String refreshTokenEndpoint =
      'https://musicooapis-production.up.railway.app/api/auth/refresh-token';
  String loginEndPoint =
      'https://musicooapis-production.up.railway.app/api/auth/login';
  Future<String> get_token() async {
    final pref = await SharedPreferences.getInstance();
    String? rtoken = pref.getString("refresh");
    if (rtoken == null) {
      throw Exception('Refresh Token not Present');
    }
    Response res = await dio
        .post(refreshTokenEndpoint, data: {"refreshToken": rtoken},
            options: Options(validateStatus: ((status) {
      log(status.toString());

      if (status == 401) {
        throw Exception('Refresh Token expired');
      }
      return true;
    })));
    log(res.statusCode.toString());
    log(res.data.toString());
    await pref.setString('access', res.data['accessToken']);
    await pref.setString('refresh', res.data['refreshToken']);
    return res.data['accessToken'];
  }

  //Login------------------------------------------------------------------------------------------------------------------------------
  Future<dynamic> login(String email, String password) async {
    final pref = await SharedPreferences.getInstance();

    log('hit');
    Response res = await dio.post(loginEndPoint,
        data: {'email': email, 'password': password},
        options: Options(
          validateStatus: (status) => true,
        ));
    log(res.statusCode.toString());

    log(res.data.toString());
    if (res.statusCode == 200) {
      await pref.setString('access', res.data['accessToken']);
      await pref.setString('refresh', res.data['refreshToken']);
    } else {
      throw Exception(res.data);
    }
  }
}

final api = Provider<API>(((ref) => API()));
