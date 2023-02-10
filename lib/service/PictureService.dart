import 'package:image_picker/image_picker.dart';

import 'dart:io';
import 'dart:async';

class PictureService{

  Future<XFile?> init() async {

    final ImagePicker _picker = ImagePicker();
    return await _picker.pickImage(source: ImageSource.camera);
  }
}