import 'package:flutter/material.dart';
import '../viewmodels/user_viewmodel.dart';

class UserWidget extends StatelessWidget {
  final UserViewModel viewModel;
  
  const UserWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('user Widget'),
    );
  }
}
