import 'package:doan_chuyen_nganh/UI/app_switch/app_switch3.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_service.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var imageURL = '';

  void uploadImage(
    ImageSource imageSource,
  ) async {
    try {
      final pickedFile = await ImagePicker().getImage(source: imageSource);
      isLoading(true);
      if (pickedFile != null) {
        var response = await ImageService.uploadFile(pickedFile.path);

        if (response.statusCode == 200) {
          Get.offAll(Tutor3());
          Get.snackbar('Success', 'Image uploaded successfully',
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        } else {
          Get.snackbar('Failed', 'Error: ${response['message']}',
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        }
      } else {
        Get.snackbar('Failed', 'Image not selected',
            margin: EdgeInsets.only(top: 5, left: 10, right: 10));
      }
    } finally {
      isLoading(false);
    }
  }
}
