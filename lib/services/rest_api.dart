import 'package:http/http.dart' as http;

class RestApi {
  static const String baseUrl = 'https://virtserver.swaggerhub.com/iCatOK/weHelpAPI/1.0.0';

  static void registerUser(Map<String, dynamic> data) async {
      final response = await http.post('$baseUrl/api/auth/registration', body: data);
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 201) {
        print("Success");
      } else {
        throw Exception("Error when requesting users (status! = 201)");
      }
  }

  static void logInUser(Map<String, String> data) async {
      final response = await http.post('$baseUrl/api/auth/login', body: data);
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 200) {
        print("Success");
      } else {
        throw Exception("Error when requesting users (status! = 200)");
      }
  }
}