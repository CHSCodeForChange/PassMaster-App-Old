import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './api.dart';
import './user.dart';
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
    
    return UserAPI().getData(token, null);
  }
}
