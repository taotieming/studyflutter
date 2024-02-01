import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<String> pickImage(ImageSource ource) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      return image?.path ?? '';
    } catch (e) {
      return '';
    }
  }
}
