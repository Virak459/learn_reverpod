import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:learning_reverpod/routes/app_router.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginWidget extends StatelessWidget {
  final LoginViewModel viewModel;

  const LoginWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: viewModel.updateEmail,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            onChanged: viewModel.updatePassword,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final user = await viewModel.login();

                context.router.replace(HomeRoute()); // Navigate to home screen
                // Navigate to home screen
              } catch (e) {
                print('Login failed: $e');
                final snackbar = SnackBar(
                  content: Text('Login failed pelase try again'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              context.router.push(
                RegisterRoute(),
              ); // Navigate to register screen
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
