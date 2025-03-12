import 'dart:convert';
import 'package:http/http.dart' as http;

class Http {
  final String baseUrl;
  const Http({required this.baseUrl});

  Future<http.Response> get(String extendPath) async {
    print('GET: $baseUrl/$extendPath');
    http.Response response = await http.get(Uri.parse('$baseUrl/$extendPath'));
    return response;
  }

  Future<http.Response> post(
    String extendPath,
    Map<String, dynamic> body,
  ) async {
    print('POST: $baseUrl/$extendPath');

    http.Response response = await http.post(
      Uri.parse('$baseUrl/$extendPath'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return response;
  }

  Future<http.Response> put(
    String extendPath,
    Map<String, dynamic> body,
  ) async {
    print('PUT: $baseUrl/$extendPath');

    http.Response response = await http.put(
      Uri.parse('$baseUrl/$extendPath'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return response;
  }

  Future<http.Response> delete(String extendPath) async {
    print('DELETE: $baseUrl/$extendPath');
    http.Response response = await http.delete(
      Uri.parse('$baseUrl/$extendPath'),
    );
    return response;
  }
}
