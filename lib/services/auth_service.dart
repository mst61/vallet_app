import 'package:http/http.dart' as http;
import 'package:vallet_app/models/user.dart';
import 'package:vallet_app/models/verify.dart';
import 'dart:convert';

import 'package:vallet_app/utils/constants.dart';

class AuthService {
  String url = baseUrl + '/auth';

  Future<User> register(User user) async {
    final response = await http.post(
      Uri.parse(url + '/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user.');
    }
  }

  Future<Verify> verify(Verify verify) async {
    final response = await http.post(
      Uri.parse(url + '/verify'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(verify),
    );

    if (response.statusCode == 200) {
      return Verify.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to verify user.');
    }
  }
}