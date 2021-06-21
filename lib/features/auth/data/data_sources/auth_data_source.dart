
import 'dart:convert';

import 'package:flutter_example05/core/error/exceptions.dart';
import 'package:flutter_example05/features/auth/data/models/auth_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthDataSource {
  Future<AuthModel> authLogin(String username, String password); 
}

class AuthDataSourceImpl implements AuthDataSource {

  final http.Client client;

  AuthDataSourceImpl({required this.client});

  @override
  Future<AuthModel> authLogin(String username, String password) async {
    
    var url = Uri.parse('http://192.168.0.14:8090/api/security/oauth/token');

    String user = 'frontendapp';
    String pass = '12345';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$pass'));

    var response = await client.post(
      url, 
      headers: <String, String>{'authorization': basicAuth},
      body: {'username': username, 'password': password, 'grant_type' : 'password'}
    );
    
    if(response.statusCode == 200) {
      return AuthModel.fromJson(json.decode(response.body));
    }else {
      throw ServerExpection();
    }
  }

}