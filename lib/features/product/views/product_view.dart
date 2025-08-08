import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as ref;
import 'package:image_picker/image_picker.dart';
import 'package:learning_reverpod/config/secure_storage_service.dart';
import 'package:learning_reverpod/features/login/viewmodels/login_viewmodel.dart';
import 'package:learning_reverpod/features/product/models/product_model.dart';
import 'package:learning_reverpod/share/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../viewmodels/product_viewmodel.dart';
import '../widgets/product_widget.dart';

@RoutePage()
class ProductView extends ConsumerWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ProductViewModel();
    final product = ProductModel(
      name: '',
      description: '',
      price: 0,
      category_id: '',
      quantity: '',
      image: '',
      add_by: '',
    );

    XFile? pickedFile;

    return Scaffold(
      appBar: AppBar(title: const Text('Product')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageUploader(
              onPicked: (picked) {
                pickedFile = picked;
                product.copyWith(image: picked.path);
              },
            ),
            ProductWidget(
              viewModel: product,
              onAddProduct: (product) async {
                print("Token from prefs: $token");
                ref.read(
                  addProductProvider(product, token.toString(), pickedFile!),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
