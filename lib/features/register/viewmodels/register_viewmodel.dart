import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:learning_reverpod/features/user/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/register_model.dart';
part 'register_viewmodel.g.dart';

final registerdata = StateNotifierProvider<RegisterViewModel, RegisterModel>(
  (ref) => RegisterViewModel(),
);

class RegisterViewModel extends StateNotifier<RegisterModel> {
  RegisterViewModel()
    : super(RegisterModel(email: '', password: '', confirmPassword: ''));

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateConfirmPassword(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  void reset() {
    state = RegisterModel(email: '', password: '', confirmPassword: '');
  }

  void setCredentials(String email, String password, String confirmPassword) {
    state = RegisterModel(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  // TODO: Add viewmodel properties and methods
  String get featureName => 'register';
  RegisterModel get currentState => state;
}

@riverpod
Future<UserModel> register(RegisterRef ref, RegisterModel registerModel) async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  var request = http.Request(
    'POST',
    Uri.parse('http://192.168.10.90:8090/api/register'),
  );
  request.body = json.encode({
    "name": "${registerModel.email.toString().split('@')[0].toString()}",
    "email": "${registerModel.email}",
    "password": "${registerModel.password}",
    "password_confirmation": "${registerModel.confirmPassword}",
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final responseBody = await response.stream.bytesToString();
    final data = jsonDecode(responseBody);

    final user = UserModel.fromJson(data['user']);
    return user;
  } else {
    print(response.reasonPhrase);

    throw Exception('Failed to register user');
  }
}
