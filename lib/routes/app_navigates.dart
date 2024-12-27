import 'package:get/get.dart';

class AppNavigates {
  AppNavigates._();

  static goToBack() {
    Get.back();
  }

  static void goToBackWithValue<T>({T? result}) {
    Get.back(result: result);
  }
}
