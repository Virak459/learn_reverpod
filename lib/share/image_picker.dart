import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImageUploader extends StatefulWidget {
  final void Function(XFile pickedFile)? onPicked;
  final void Function(String response)? onUploaded;

  const ImageUploader({super.key, this.onPicked, this.onUploaded});

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  XFile? _pickedFile;
  Uint8List? _webImage;
  bool _isUploading = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _pickedFile = picked;
      });

      if (kIsWeb) {
        _webImage = await picked.readAsBytes();
      }

      // Notify parent
      widget.onPicked?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final imageWidget = _pickedFile != null
    //     ? kIsWeb
    //           ? Image.memory(_webImage!, height: 80, fit: BoxFit.cover)
    //           : Image.file(
    //               File(_pickedFile!.path),
    //               height: 80,
    //               fit: BoxFit.cover,
    //             )
    //     : const Text("No image selected");

    return Column(
      children: [
        // imageWidget,
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.photo),
              label: const Text("Pick Image"),
            ),
            const SizedBox(width: 10),
            // ElevatedButton.icon(
            //   onPressed: _isUploading ? null : _uploadImage,
            //   icon: _isUploading
            //       ? const CircularProgressIndicator()
            //       : const Icon(Icons.upload),
            //   label: const Text("Upload"),
            // ),
          ],
        ),
      ],
    );
  }
}
