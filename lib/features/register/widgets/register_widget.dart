import 'package:flutter/material.dart';
import 'package:learning_reverpod/features/register/models/register_model.dart';
import '../viewmodels/register_viewmodel.dart';

class RegisterWidget extends StatelessWidget {
  final RegisterViewModel viewModel;
  final void Function(RegisterModel) onRegister;
  RegisterWidget({Key? key, required this.viewModel, required this.onRegister})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('register Widget'),
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
            onChanged: (value) => viewModel.updateEmail(value),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            onChanged: (value) => viewModel.updatePassword(value),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
            onChanged: (value) => viewModel.updateConfirmPassword(value),
          ),
          ElevatedButton(
            onPressed: () {
              onRegister(
                RegisterModel(
                  email: viewModel.currentState.email,
                  password: viewModel.currentState.password,
                  confirmPassword: viewModel.currentState.confirmPassword,
                ),
              );
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
