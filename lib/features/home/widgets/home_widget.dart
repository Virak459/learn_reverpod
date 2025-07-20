import 'package:flutter/material.dart';
import '../viewmodels/home_viewmodel.dart';

class HomeWidget extends StatelessWidget {
  final HomeViewModel viewModel;
  
  const HomeWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('home Widget'),
    );
  }
}
