import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:learning_reverpod/routes/app_router.dart';
import '../viewmodels/home_viewmodel.dart';
import '../widgets/home_widget.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final asyncUser = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Home View')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center(
          //   child: asyncUser.when(
          //     data: (user) => Text('User: ${user.name}'),
          //     error: (error, stack) => Text('Error: $error'),
          //     loading: () => const CircularProgressIndicator(),
          //   ),
          // ),
          TextButton(
            onPressed: () {
              context.router.push(ProductRoute()); // Navigate to HomeView
            },
            child: const Text('Go to Product View'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.pushNamed('/user'); // Navigate to HomeView
        },
        child: const Icon(Icons.supervised_user_circle),
      ),
    );
  }
}
