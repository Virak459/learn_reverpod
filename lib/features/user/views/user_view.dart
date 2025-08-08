import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learning_reverpod/features/login/viewmodels/login_viewmodel.dart';
import 'package:learning_reverpod/features/user/models/user_model.dart';
import 'package:learning_reverpod/features/user/widgets/user_widget.dart';
import '../viewmodels/user_viewmodel.dart';

@RoutePage()
class UserView extends HookConsumerWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final asyncUser = ref.watch(userProfileProvider);
    // final userViewModel = ref.watch(userProfileProvider);
    final call_user = ref.watch(userServiceProvider);
    // print(userViewModel);
    final user_after_get = ref.watch(Token_user);
    final viewModel = LoginViewModel();
    print("Data after get: ${user_after_get}");
    return Scaffold(
      appBar: AppBar(title: Text('User View${viewModel.currentState}')),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Future<(String, UserModel)> user_called = call_user.login(
                  "kaka@gmail.com",
                  "kaka12345",
                );
                user_called.then((value) {
                  print("usered is : ${value.$2.name}\n");
                });
              },
              child: Text("Call User ${user_after_get}"),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: const Text('User View')),
    //   body: Center(
    //     child: userViewModel.when(
    //       data: (user) => UserWidget(viewModel: user),
    //       error: (error, stack) {
    //         print('Error: $error');
    //         return Text('Error: $error');
    //       },
    //       loading: () => const CircularProgressIndicator(),
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       context.router.pushNamed('/'); // Navigate to HomeView
    //     },
    //     child: const Icon(Icons.home),
    //   ),
    // );
  }
}
