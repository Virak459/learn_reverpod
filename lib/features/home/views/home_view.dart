import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../viewmodels/home_viewmodel.dart';
import '../widgets/home_widget.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel();

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: HomeWidget(viewModel: viewModel),
    );
  }
}
