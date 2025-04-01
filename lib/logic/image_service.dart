import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class ImageService extends ChangeNotifier {
  // frajerbase storage

  // dodawanie url do usera w db
  List<String> _tempUrls = [];

  //
  Future<void> deleteImage(String url) async {}
  Future<void> getImage() async {
    //dla danego usera w sesji
  }
  Future<void> setImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    File file = File(image.path);
  }
}
