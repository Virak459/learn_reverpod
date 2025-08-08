import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product_model.dart';
part 'product_viewmodel.g.dart';

final productViewModelProvider =
    StateNotifierProvider<ProductViewModel, ProductModel>(
      (ref) => ProductViewModel(),
    );

class ProductViewModel extends StateNotifier<ProductModel> {
  ProductViewModel()
    : super(
        ProductModel(
          name: '',
          description: '',
          price: 0.0,
          category_id: '',
          quantity: '',
          image: '',
          add_by: '',
        ),
      );

  void updateProduct({
    required String name,
    required String description,
    required double price,
    required String category_id,
    required String quantity,
    required String image,
    required String add_by,
  }) {
    state = state.copyWith(
      name: name,
      description: description,
      price: price,
      category_id: category_id,
      quantity: quantity,
      image: image,
      add_by: add_by,
    );
  }

  void productDetails(ProductModel product) {
    state = product;
  }
}

@riverpod
Future<void> addProduct(
  Ref ref,
  ProductModel product,
  String token,
  XFile? pickedFile,
) async {
  final headers = {'Authorization': 'Bearer $token'};
  final request = http.MultipartRequest(
    'POST',
    Uri.parse('http://192.168.10.90:8090/api/products'),
  );
  request.fields.addAll({
    'name': product.name,
    'price': product.price.toString(),
    'category_id': product.category_id,
    'supplier_id': product.add_by,
    'add_by': product.add_by,
  });
  Uint8List? webImage;
  if (kIsWeb) {
    webImage = await pickedFile!.readAsBytes();
  }
  if (kIsWeb && pickedFile != null) {
    request.files.add(
      http.MultipartFile.fromBytes(
        'image',
        webImage!,
        filename: pickedFile.name,
      ),
    );
  } else {
    final file = File(pickedFile!.path);
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
  }
  request.headers.addAll(headers);

  final http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

@riverpod
Future<ProductModel> getProduct(Ref ref) async {
  final response = await http.get(
    Uri.parse('http://your-api-endpoint/products'),
  );
  return ProductModel.fromJson(jsonDecode(response.body));
}
