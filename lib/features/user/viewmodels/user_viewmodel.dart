import '../models/user_model.dart';

class UserViewModel {
  final UserModel _model = UserModel(id: '', name: '', email: '');

  // TODO: Add viewmodel properties and methods
  String get featureName => 'user';
}
