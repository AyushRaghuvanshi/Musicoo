import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  Dio dio = Dio();
  String refreshTokenEndpoint =
      'https://musicooapis-production.up.railway.app/api/auth/refresh-token';
  Future<String> get_token() async {
    final pref = await SharedPreferences.getInstance();
    String? rtoken = pref.getString("refresh");
    if (rtoken == null) {
      throw Exception('Refresh Token not Present');
    }
    Response res = await dio
        .post(refreshTokenEndpoint, data: {"refreshToken": rtoken},
            options: Options(validateStatus: ((status) {
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
}

final tokenprovider = Provider<API>(((ref) => API()));
