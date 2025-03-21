import 'package:http/http.dart';
import 'http_service.dart';

class AuthService {
  final Http http = Http(baseUrl: 'http://10.0.2.2:3000/taskZen/auth');
  // singleton pattern
  AuthService._private();
  static final AuthService _instance = AuthService._private();

  factory AuthService() {
    return _instance;
  }
  //

  Future<Response> login(String username, String password) async {
    final response = await http.post('login', {
      'username': username,
      'password': password,
    }, {});
    return response;
  }

  Future<Response> signUp(String username, String password) async {
    final response = await http.post('register', {
      'username': username,
      'password': password,
    }, {});
    return response;
  }

  Future<bool> verifyToken(String token) async {
    final response = await http.get("verifyToken", {
      "Authorization": "Bearer $token",
    });
    final isValid = (response.statusCode == 200);
    return isValid;
  }
}
