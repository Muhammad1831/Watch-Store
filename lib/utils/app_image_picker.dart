import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  File? _image;

  Future<void> imagePicker({required ImageSource source}) async {
    final imageSelected = await ImagePicker().pickImage(source: source);
    if (imageSelected == null) return;

    _image = await imageCropper(image: File(imageSelected.path));
  }

  Future<File?> imageCropper({required File image}) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: image.path);

    if (croppedFile == null) return null;
    
    return File(croppedFile.path);
  }

  File? get image => _image;
}
