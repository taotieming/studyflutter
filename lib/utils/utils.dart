import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<String> pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      return image?.path ?? '';
    } catch (e) {
      return '';
    }
  }

  static Future<CroppedFile?> croppedImage(String path) async {
    final result = await ImageCropper().cropImage(sourcePath: path);
    return result;
  }
}
