import 'dart:convert';
import 'package:blog_post_app/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<List<User>> fetchUser() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      return compute(parseUser, response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  static List<User> parseUser(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}