import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:we_help/exceptions.dart';
import 'package:we_help/models/public_question.dart';
import 'package:we_help/models/user.dart';

class RestApi {
  static const String baseUrl =
      'https://virtserver.swaggerhub.com/iCatOK/weHelpAPI/1.0.0';

// Todo: delete status code from return

  static Future<int> registerUser(Map<String, dynamic> data) async {
    final response =
        await http.post('$baseUrl/api/auth/registration', body: data);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    if (response.statusCode == 201) {
      print("Success");
    } else {
      throw Exception("Error when requesting users (status! = 201)");
    }
    return response.statusCode;
  }

  static Future<int> logInUser(Map<String, String> data) async {
    final response = await http.post('$baseUrl/api/auth/login', body: data);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    if (response.statusCode == 200) {
      print("Success");
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
    return response.statusCode;
  }

  static Future<int> postQuestion(Map<String, dynamic> data) async {
    final response = await http.post('$baseUrl/api/questions', body: data);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    if (response.statusCode == 200) {
      print("Success");
    } else if (response.statusCode == 500) {
      throw ServerError("ServerError");
    } else {
      throw InternetError("Check Internet or data");
    }
    return response.statusCode;
  }

  static Future<List<PublicQuestion>> getActual() async {
    final response = await http.get('$baseUrl/api/questions');
    if (response.statusCode == 200) {
      print("Success, $response");
      return _parseQuestions(response.body);
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
  }

  static Future<List<User>> searchUsers(String searchRequest) async {
    final response = await http.get('$baseUrl/api/search/user');
    if (response.statusCode == 200) {
      print("Success, $response");
      return _parseUsers(response.body);
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
  }

  static List<User> _parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    print(parsed);
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  static List<PublicQuestion> _parseQuestions(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<PublicQuestion>((json) => PublicQuestion.fromJson(json))
        .toList();
  }

  static void searchQuestions(String searchRequest) {}

  static void searchArticle(String searchRequest) {}
}
