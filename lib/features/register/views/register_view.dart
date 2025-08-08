import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_reverpod/features/register/models/register_model.dart';
import 'package:learning_reverpod/routes/app_router.dart';
import '../viewmodels/register_viewmodel.dart';
import '../widgets/register_widget.dart';

@RoutePage()
class RegisterView extends ConsumerWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = RegisterViewModel();
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              RegisterWidget(
                viewModel: viewModel,
                onRegister: (model) async {
                  try {
                    final user = ref.read(registerProvider(model));
                    print("User registered: ${model.email}");
                    context.router.replace(LoginRoute()); // Navigate to login
                  } catch (e) {
                    print('Registration failed: $e');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
