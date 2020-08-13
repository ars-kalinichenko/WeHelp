import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static final String _loginKey = 'login';
  static final String _passwordKey = 'password';

  static Future<void> setLogin(String login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_loginKey, login);
  }

  static Future<String> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String login = prefs.getString(_loginKey);
    return login;
  }

  static Future<void> setPassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_passwordKey, password);
  }

  static Future<String> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String password = prefs.getString(_passwordKey);
    return password;
  }

  static Future<bool> isLogIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_loginKey) & prefs.containsKey(_passwordKey);
  }

  static void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_loginKey);
    prefs.remove(_passwordKey);
  }
}
