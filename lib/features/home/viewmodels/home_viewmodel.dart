import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

import '../models/home_model.dart';
part 'home_viewmodel.g.dart';

@riverpod
Future<HomeModel> user(UserRef ref) async {
  final response = await http.get(
    Uri.parse('https://fakestoreapi.com/users/5'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return HomeModel.fromJson(json);
  } else {
    throw Exception('Failed to load user');
  }
}
