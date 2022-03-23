

import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreenController extends GetxController {

  File? imageFile;

  final _picker = ImagePicker();
 getFromGallery() async {
  final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    imageFile = File(pickedImage.path);
   update();
  }
 }
}