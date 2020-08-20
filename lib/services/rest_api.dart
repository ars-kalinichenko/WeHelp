import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:we_help/exceptions.dart';
import 'package:we_help/models/article.dart';
import 'package:we_help/models/public_question.dart';
import 'package:we_help/models/user.dart';

class RestApi {
  static const String baseUrl =
      'https://virtserver.swaggerhub.com/iCatOK/weHelpAPI/1.0.0';
  static final String _authority = "virtserver.swaggerhub.com";
  static final String _path = "/iCatOK/weHelpAPI/1.0.0/api";

  // Todo: delete status code from return

  static Future<void> registerUser(Map<String, dynamic> data) async {
    final response = await http.post(
        'http://wehelp-apiserver-stage.us.aldryn.io/auth/registration/',
        body: data);
    if (response.statusCode == 201) {
      print("Success");
    } else {
      throw Exception(response.body);
    }
  }

  static Future<String> logInUser(String login, String password) async {
    /// return auth key.

    Map<String, String> data = {"email": login, "password": password};
    final response = await http.post("http://wehelp-apiserver-stage.us.aldryn.io/auth/login/", body: data);
    final parsed = json.decode(response.body);
    if (response.statusCode == 200) {
      print("Success");
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
    return (parsed["key"]);
  }

  static Future<int> postQuestion(Map<String, dynamic> data) async {
    final response = await http.post('$baseUrl/api/questions', body: data);
    if (response.statusCode == 200) {
      print("Success posted question.");
    } else if (response.statusCode == 500) {
      throw ServerError("ServerError");
    } else {
      throw InternetError("Check Internet or data");
    }
    return response.statusCode;
  }

  static Future<List<PublicQuestion>> getActual() async {
    final response = await http
        .get('http://wehelp-apiserver-stage.us.aldryn.io/api/questions/');
    if (response.statusCode == 200) {
      return _parseQuestions(response.bodyBytes);
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
  }

  static Future<List<Article>> getArticles() async {
    final response = await http.get('$baseUrl/api/articles');
    String source = Utf8Decoder().convert(response.bodyBytes);
    if (response.statusCode == 200) {
      print("Success, $response");
      return _parseArticle(source);
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
  }

  static Future<List<User>> searchUsers(String filter) async {
    final params = {"filter": filter};
    final uri = Uri.https(_authority, "$_path/users", params);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return _parseUsers(response.bodyBytes);
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
  }

  static Future<List<PublicQuestion>> searchQuestions(String filter) async {
    final params = {"filter": filter};
    final uri = Uri.https(_authority, "$_path/questions", params);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return _parseQuestions(response.bodyBytes);
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
  }

// todo: group
  static List<User> _parseUsers(List<int> responseBodyBytes) {
    String source = Utf8Decoder().convert(responseBodyBytes);
    final parsed = json.decode(source).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  static List<PublicQuestion> _parseQuestions(List<int> responseBodyBytes) {
    String source = Utf8Decoder().convert(responseBodyBytes);
    final parsed = json.decode(source).cast<Map<String, dynamic>>();
    return parsed
        .map<PublicQuestion>((json) => PublicQuestion.fromJson(json))
        .toList();
  }

  static List<Article> _parseArticle(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Article>((json) => Article.fromJson(json)).toList();
  }

  static Future<List<Article>> searchArticle(String searchRequest) async {}
}
