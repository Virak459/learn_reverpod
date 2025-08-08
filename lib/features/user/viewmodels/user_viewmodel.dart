import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:learning_reverpod/config/secure_storage_service.dart';
import '../models/user_model.dart';

final userServiceProvider = Provider<UserService>((ref) => UserService());

// ViewModel provider
final userProfileProvider = FutureProvider<UserModel>((ref) async {
  final userService = ref.read(userServiceProvider);
  final (token, user) = await userService.login("kaka@gmail.com", "kaka12345");

  // await secureStorage.saveToken(token); // ✅ Save securely

  return user;
});

class UserService {
  Future<(String token, UserModel user)> login(
    String email,
    String password,
  ) async {
    final request = http.Request('POST', Uri.parse('c/api/login'));

    request.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    request.body = jsonEncode({"email": email, "password": password});

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);
      final token = data['token'] as String;
      final user = UserModel.fromJson(data['user']);
      return (token, user);
    } else {
      throw Exception('Login failed: ${response.reasonPhrase}');
    }
  }
}
