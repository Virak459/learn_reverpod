import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../viewmodels/login_viewmodel.dart';
import '../widgets/login_widget.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = LoginViewModel();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LoginWidget(viewModel: viewModel),
      ),
    );
  }
}
