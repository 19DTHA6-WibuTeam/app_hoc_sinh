import 'package:get/get.dart';

class StudentPostController extends GetxController {
  RxString subject = "".obs;

  void setSubjectSelected(String value) {
    subject.value = value;
  }
}
