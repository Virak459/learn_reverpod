import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._(); // Needed for custom methods/getters

  const factory UserModel({
    required String id,
    required String name,
    required String email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  String get initials {
    final nameValue = (this as _UserModel).name;
    return nameValue.isEmpty ? '' : nameValue[0].toUpperCase();
  }
}
