import 'package:get/get.dart';
import 'package:accurate/pages/about/controllers/c_about.dart';

class AboutBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(() => AboutController());
  }
}
