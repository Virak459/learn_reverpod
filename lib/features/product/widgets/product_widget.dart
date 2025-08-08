import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_reverpod/features/product/models/product_model.dart';
import 'package:learning_reverpod/share/image_picker.dart';
import '../viewmodels/product_viewmodel.dart';

class ProductWidget extends StatelessWidget {
  ProductModel viewModel;
  final void Function(ProductModel) onAddProduct;
  ProductWidget({Key? key, required this.viewModel, required this.onAddProduct})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('product Widget'),
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
            onChanged: (value) {
              viewModel.copyWith(name: value);
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
            onChanged: (value) {
              viewModel.copyWith(description: value);
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
            onChanged: (value) {
              viewModel.copyWith(price: double.parse(value));
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Category ID'),
            onChanged: (value) {
              viewModel.copyWith(category_id: value);
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Quantity'),
            onChanged: (value) {
              viewModel.copyWith(quantity: value);
            },
          ),
          // TextField(
          //   decoration: InputDecoration(labelText: 'Image'),
          //   onChanged: (value) {
          //     viewModel.copyWith(image: value);
          //   },
          // ),
          ImageUploader(
            onPicked: (picked) {
              viewModel.copyWith(image: picked.path);
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Add By'),
            onChanged: (value) {
              viewModel.copyWith(add_by: value);
            },
          ),
          ElevatedButton(
            onPressed: () {
              onAddProduct(viewModel);
            },
            child: Text('Add Product'),
          ),
        ],
      ),
    );
  }
}
