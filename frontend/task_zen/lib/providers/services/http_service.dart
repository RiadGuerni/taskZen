import 'dart:convert';
import 'package:http/http.dart' as http;

class Http {
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'User-Agent': 'YourAppName/1.0 (Dart)',
    'Accept-Encoding': 'gzip, deflate',
    'Cache-Control': 'no-cache',
    'Connection': 'keep-alive',
    'DNT': '1', // Do Not Track Request Header
  };
  final String baseUrl;
  const Http({required this.baseUrl});

  Future<http.Response> get(
    String extendPath,
    Map<String, String> headers,
  ) async {
    headers = {...defaultHeaders, ...headers};
    http.Response response = await http.get(
      Uri.parse('$baseUrl/$extendPath'),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> post(
    String extendPath,
    Map<String, dynamic> body,
    Map<String, String> headers,
  ) async {
    headers = {...defaultHeaders, ...headers};
    http.Response response = await http.post(
      Uri.parse('$baseUrl/$extendPath'),
      headers: headers,
      body: jsonEncode(body),
    );
    return response;
  }

  Future<http.Response> put(
    String extendPath,
    Map<String, dynamic> body,
    headers,
  ) async {
    headers = {...defaultHeaders, ...headers};
    http.Response response = await http.put(
      Uri.parse('$baseUrl/$extendPath'),
      headers: headers,
      body: jsonEncode(body),
    );
    return response;
  }

  Future<http.Response> delete(
    String extendPath,
    Map<String, String> headers,
  ) async {
    headers = {...defaultHeaders, ...headers};
    http.Response response = await http.delete(
      Uri.parse('$baseUrl/$extendPath'),
      headers: headers,
    );
    return response;
  }
}
