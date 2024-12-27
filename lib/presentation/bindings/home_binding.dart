
import 'package:camera_located/presentation/base/location_controller.dart';
import 'package:camera_located/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController(),);
    Get.put(HomeController());
  }
}
