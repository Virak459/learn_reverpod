import 'package:flutter/material.dart';
import '../viewmodels/user_viewmodel.dart';
import '../widgets/user_widget.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = UserViewModel();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: UserWidget(viewModel: viewModel),
    );
  }
}
