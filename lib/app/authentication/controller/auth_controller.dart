import 'package:get/get.dart';

class AuthController extends GetxController {


  var isLoader = false.obs;
  updateLoader(value) {
    isLoader.value = value;
    update();
  }
}
