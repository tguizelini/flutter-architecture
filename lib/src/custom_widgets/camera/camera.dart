import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class CustomCamera {
  static Future<dynamic> openCamera({ bool getBase64 = true }) async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    
    if (getBase64 == true) {
      List<int> base64Byte = image.readAsBytesSync();
      String base64Encoded = base64Encode(base64Byte);

      final imageBase64 = base64.decode(base64Encoded.toString());

      print('base64 -> $imageBase64');

      return imageBase64;
    }

    return image;
  }

  static Future<dynamic> openGallery({ bool getBase64 = true }) async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (getBase64 == true) {
      List<int> base64Byte = image.readAsBytesSync();
      String base64Encoded = base64Encode(base64Byte);

      final imageBase64 = base64.decode(base64Encoded.toString());

      print('base64 -> $imageBase64');

      return imageBase64;
    }

    return image;
  }
}