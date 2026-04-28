import 'dart:convert';

import 'package:active_flutter_delivery_app/app_config.dart';
import 'package:active_flutter_delivery_app/data_model/common_response.dart';
import 'package:active_flutter_delivery_app/data_model/login_response.dart';
import 'package:active_flutter_delivery_app/data_model/logout_response.dart';
import 'package:active_flutter_delivery_app/helpers/api_request.dart';
import 'package:active_flutter_delivery_app/helpers/shared_value_helper.dart';

class AuthRepository {
  Future<LoginResponse> getLoginResponse(
      String? email, String password, String loginBy) async {
    var postBody = jsonEncode({
      "user_type": "delivery_boy",
      "email": "$email",
      "password": password,
      "login_by": loginBy
    });

    final response = await ApiRequest.post(
        url: ("${AppConfig.BASE_URL}/auth/login"),
        headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLApiRequestRequest"
        },
        body: postBody);
    // print(response.body);
    return loginResponseFromJson(response.body);
  }

  Future<LogoutResponse> getLogoutResponse() async {
    final response = await ApiRequest.get(
      url: ("${AppConfig.BASE_URL}/auth/logout"),
      headers: {"Authorization": "Bearer ${access_token.$}"},
    );

    return logoutResponseFromJson(response.body);
  }

  Future<LoginResponse> getUserByTokenResponse() async {
    var postBody = jsonEncode({"access_token": "${access_token.$}"});

    final response = await ApiRequest.post(
        url: ("${AppConfig.BASE_URL}/auth/info"),
        headers: {"Content-Type": "application/json"},
        body: postBody);

    return loginResponseFromJson(response.body);
  }

  Future<CommonResponse> getAccountDeleteResponse() async {
    String url = ("${AppConfig.BASE_URL}/auth/account-deletion");

    // print(url.toString());

    // print("Bearer ${access_token.$}");
    final response = await ApiRequest.get(
      url: url,
      headers: {
        "Authorization": "Bearer ${access_token.$}",
        "App-Language": app_language.$!,
      },
    );
    // print(response.body);
    return commonResponseFromJson(response.body);
  }
}
