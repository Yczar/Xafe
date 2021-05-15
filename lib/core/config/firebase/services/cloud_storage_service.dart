import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:xafe/core/error/helpers/helpers.dart';


class XafeCloudStorage {
  final FirebaseStorage _instance = FirebaseStorage.instance;

  Future<void> uploadFile({
    String fileBucket,
    String filePath,
    String type = 'image/png',
  }) async {
    final File file = File(filePath);
    return await firebaseInterceptor(
      () => _instance.ref(fileBucket).putFile(
            file,
            SettableMetadata(contentType: type),
          ),
    );
  }

  Future<String> getDownloadFileUrl({
    String downloadPath,
  }) async {
    return await firebaseInterceptor(
      () => _instance.ref(downloadPath).getDownloadURL(),
    );
  }
}
