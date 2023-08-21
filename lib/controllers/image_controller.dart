
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  final imagePath = "".obs;
  final imagePicker = ImagePicker();

  Future<void> getImageFromCamera() async {
    var image = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 25);
    imagePath(image!.path);
    await cropImage();
  }

  Future<void> getImageFromGallery() async {
    var image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
        maxHeight: 1800,
        maxWidth: 1800);
    imagePath(image!.path);
    await cropImage();
  }

  Future<void> cropImage() async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imagePath.value,
      maxHeight: 1800,
      maxWidth: 1800,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ],
    );
    imagePath.value =
        croppedImage == null ? imagePath.value : croppedImage.path;
  }
}
