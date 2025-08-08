import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_model.freezed.dart';

@freezed
abstract class HomeModel with _$HomeModel {
  const factory HomeModel({
    required int id,
    required String name,
    required String email,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    final name = "${json['name']['firstname']} ${json['name']['lastname']}";
    return HomeModel(id: json['id'], name: name, email: json['email']);
  }

  // This is needed for toJson if you use local serialization
  // factory UserModel.fromJson(Map<String, dynamic> json) =>
  //     _$UserModelFromJson(json);
}
