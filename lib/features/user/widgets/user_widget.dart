import 'package:flutter/material.dart';
import 'package:learning_reverpod/features/user/models/user_model.dart';
import '../viewmodels/user_viewmodel.dart';

class UserWidget extends StatelessWidget {
  final UserModel viewModel;

  const UserWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'user Widget $context\n'
            'id: ${viewModel.id}\n'
            'name: ${viewModel.name}\n'
            'email: ${viewModel.email}\n'
            'emailVerifiedAt: ${viewModel.emailVerifiedAt ?? "Not Verified"}\n'
            'createdAt: ${viewModel.createdAt}\n'
            'updatedAt: ${viewModel.updatedAt}\n'
            'profilePhoto: ${viewModel.profilePhoto ?? "No Photo"}',
          ),
        ),
      ],
    );
  }
}
