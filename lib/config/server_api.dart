import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

String _requireEnv(String key) {
  final value = dotenv.env[key];
  if (value == null || value.isEmpty) {
    throw AssertionError('$key is not defined in .env file');
  }
  return value;
}

final String apiBaseUrl = _requireEnv('API_BASE_URL');
final String apiScheme = _requireEnv('API_SCHEME');
final int apiLocalPort = int.parse(_requireEnv('API_LOCAL_PORT'));

class ApiService {
  static Future<Map<String, dynamic>> fetchMapData(
    double lat,
    double lng,
  ) async {
    final url = Uri.parse(
      'http://127.0.0.1:8000/api/map_thai?lat=$lat&lng=$lng',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load map data');
    }
  }
}
