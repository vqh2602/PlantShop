import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/homeControler.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
