import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './api.dart';
import '../models/user.dart';
import '../models/pass.dart';

class PassListAPI extends API {
  Future<Iterable<PassModel>> getData(String token) async {
    String url = this.baseUrl + 'passes/?format=json';
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Authorization": token, 
      }
    );
    
    List raw_passes = json.decode(response.body);

    Iterable<PassModel> passes = (raw_passes).map((i) => new PassModel.fromJson(i));
    for (PassModel pass in passes) {
      pass.fillUsers(token);
    }

    return passes;
  }
}
