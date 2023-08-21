import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageServices {
  static final FirebaseStorageServices _firebaseStorageServices =
      FirebaseStorageServices._initialization();

  FirebaseStorageServices._initialization();

  factory FirebaseStorageServices() {
    return _firebaseStorageServices;
  }

  static FirebaseStorageServices get firebaseStorageServices =>
      _firebaseStorageServices;

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final String _path = "user/images/";
  Future<void> setUserImage(String id, File file) async {
    await _firebaseStorage.ref().child("$_path${id}profileImage").putFile(file);
  }

  Future<String> getUserImage(String id) async {
    return await _firebaseStorage.ref().child("$_path${id}profileImage").getDownloadURL();
  }



}
