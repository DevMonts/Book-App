import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class UploadImageProvider extends ChangeNotifier {
  Future<String> uploadImage(
    File image,
  ) async {
    String imageName = basename(
      image.path,
    );
    Reference path = FirebaseStorage.instance.ref().child(
      'book_covers_images/$imageName',
    );
    UploadTask uploadTask = path.putFile(
      image,
    );
    await uploadTask;
    String imageUrl = await path.getDownloadURL();
    return imageUrl;
  }
}
