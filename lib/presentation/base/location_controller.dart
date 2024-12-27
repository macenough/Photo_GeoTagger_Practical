import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString currentLocation = ''.obs;

  @override
  void onInit() {
    getLocation();
    super.onInit();

  }

  getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.high),
      );
      currentLocation.value =
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      latitude.value = position.latitude;
      longitude.value = position.longitude;
    } catch (e) {
      currentLocation.value = '';
    }
  }
}
