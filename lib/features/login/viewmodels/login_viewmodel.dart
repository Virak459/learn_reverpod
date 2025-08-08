import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:learning_reverpod/features/user/models/user_model.dart';

import '../models/login_model.dart';

final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>(
      (ref) => LoginViewModel(),
    );
final Token_user = Provider<String>((ref) {
  return token;
});
var token;

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel() : super(LoginState(email: '', password: ''));
  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void reset() {
    state = LoginState(email: '', password: '');
  }

  void setCredentials(String email, String password) {
    state = LoginState(email: email, password: password);
  }

  String get get_token => token ?? '';
  LoginState get currentState => state;
  Future<UserModel> login() async {
    final request = http.Request(
      'POST',
      Uri.parse('http://192.168.10.90:8090/api/login'),
    );

    request.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    request.body = jsonEncode({
      "email": state.email,
      "password": state.password,
    });
    print("User login request it : ${request.body}");
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);
      token = data['token'] as String;
      print("Token is : $token");
      final user = UserModel.fromJson(data['user']);
      return user;
    } else {
      throw Exception('Login failed: ${response.reasonPhrase}');
    }
  }
}
