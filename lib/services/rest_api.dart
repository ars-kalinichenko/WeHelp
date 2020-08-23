import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:we_help/models/post.dart';
import 'package:we_help/models/private_user.dart';
import 'package:we_help/models/public_question.dart';
import 'package:we_help/models/question_detail.dart';
import 'package:we_help/models/user.dart';
import 'package:we_help/repository/auth.dart';

class RestApi {
  //todo: remove
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
      print("Success registerUser");
    } else {
      throw Exception(response.body);
    }
  }

  static Future<String> logInUser(String login, String password) async {
    /// return auth key.

    Map<String, String> data = {"email": login, "password": password};
    final response = await http.post(
        "http://wehelp-apiserver-stage.us.aldryn.io/auth/login/",
        body: data);
    final parsed = json.decode(response.body);
    if (response.statusCode == 200) {
      print("Success logInUser");
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
    return (parsed["key"]);
  }

  static Future<PrivateUser> getUserInfo() async {
    /// return auth key.
    final authKey = await AuthRepository.getKey(); // todo: bad practice
    final response = await http.get(
        "http://wehelp-apiserver-stage.us.aldryn.io/auth/user",
        headers: {"Authorization": "Token $authKey"});
    final source = Utf8Decoder().convert(response.bodyBytes);
    final parsed = json.decode(source);
    final userInfo = PrivateUser.fromJson(parsed);
    if (response.statusCode == 200) {
      print("Success getUserInfo");
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
    return userInfo;
  }

  static Future<void> changeUserInfo(dynamic json) async {
    /// return auth key.
    final authKey = await AuthRepository.getKey(); // todo: bad practice
    final response = await http.put(
        "http://wehelp-apiserver-stage.us.aldryn.io/auth/user/",
        body: json,
        headers: {
          "Authorization": "Token $authKey",
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      print("Success changeUserInfo");
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
  }

  static Future<void> postQuestion(dynamic json) async {
    final authKey = await AuthRepository.getKey(); // todo: bad practice
    final response = await http.post(
        'http://wehelp-apiserver-stage.us.aldryn.io/api/questions/',
        body: json,
        headers: {
          "Authorization": "Token $authKey",
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 201) {
      print("Success posted question.");
    } else {
      throw Exception("Check Internet or data");
    }
  }

  static Future<void> postAnswer(Map<String, dynamic> data) async {
    final authKey = await AuthRepository.getKey(); // todo: bad practice
    final response = await http.post(
        'http://wehelp-apiserver-stage.us.aldryn.io/api/answers/',
        body: data,
        headers: {
          "Authorization": "Token $authKey",
        });
    if (response.statusCode == 201) {
      print("Success posted question.");
    } else {
      throw Exception("Check Internet or data");
    }
  }

  static Future<DetailQuestion> getQuestionDetail(int id) async {
    /// return auth key.
    final authKey = await AuthRepository.getKey();
    final response = await http.get(
        "http://wehelp-apiserver-stage.us.aldryn.io/api/questions/$id",
        headers: {"Authorization": "Token $authKey"});
    final source = Utf8Decoder().convert(response.bodyBytes);
    final parsed = json.decode(source);
    final detailQuestion = DetailQuestion.fromJson(parsed);
    if (response.statusCode == 200) {
      print("Success getQuestionDetail");
    } else {
      throw Exception("Error when requesting users (status! = 200)");
    }
    return detailQuestion;
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

  static Future<List<Post>> searchPosts(String filter) async {
    final params = {"filter": filter};
    final uri = Uri.https(_authority, "$_path/articles", params);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return _parsePosts(response.bodyBytes);
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

  static List<Post> _parsePosts(List<int> responseBodyBytes) {
    String source = Utf8Decoder().convert(responseBodyBytes);
    final parsed = json.decode(source).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }
}
