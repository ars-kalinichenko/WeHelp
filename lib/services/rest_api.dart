import 'package:http/http.dart' as http;
import 'package:we_help/exceptions.dart';

class RestApi {
  static const String baseUrl =
      'https://virtserver.swaggerhub.com/iCatOK/weHelpAPI/1.0.0';

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
}
