import 'package:http/http.dart';
import 'package:riverpod/riverpod.dart';
import 'http.dart';

class AuthService {
  final Http http = Http(baseUrl: 'http://localhost:3000/taskZen/auth');
  // singleton pattern
  AuthService._private();
  static final AuthService _instance = AuthService._private();

  factory AuthService() {
    return _instance;
  }
  //

  Future<Response> login(String email, String password) async {
    final response = await http.post('login', {
      'email': email,
      'password': password,
    });
    return response;
  }

  Future<Response> register(String email, String password) async {
    final response = await http.post('register', {
      'email': email,
      'password': password,
    });
    return response;
  }

  getCurrentUser() {
    // get the user from local storage
    return null;
  }
}

final _authService = AuthService();
final authServiceProvider = Provider<AuthService>((ref) => _authService);
