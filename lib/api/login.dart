import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './api.dart';
import '../models/user.dart';

class LoginAPI extends API {
  Future<UserModel> getData(String username, String password) async {
    String url = this.baseUrl + 'login/?format=json';
    var response = await http.post(
      Uri.encodeFull(url),
      body: {
        "username": username, 
        "password": password,
      }
    );
    String token = "Token " + json.decode(response.body)['token'];

    url = this.baseUrl + 'user/?format=json';
    response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Authorization": token, 
      }
    );

    print(UserModel.fromJson(json.decode(response.body)).token);
    return UserModel.fromJson(json.decode(response.body));
  }
}
