import 'package:get/get.dart';
import 'package:accurate/pages/dashboard/controllers/c_dashboard.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
