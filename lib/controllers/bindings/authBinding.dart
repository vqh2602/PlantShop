import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/authController.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<AuthController>(AuthController());
    Get.put<UserController>(UserController());
  }
}
