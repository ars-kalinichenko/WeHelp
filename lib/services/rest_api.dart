import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:we_help/models/user.dart';

class RestApi {
  static const String baseUrl = 'https://virtserver.swaggerhub.com/iCatOK/weHelpAPI/1.0.0';

  static void registerUser(Map<String, dynamic> data) async {
    try {
      final response = await http.post('$baseUrl/api/auth/registration', body: data);
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 201) {
        print("Success");
      } else {
        throw Exception("Error when requesting users (status! = 201)");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<User> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}