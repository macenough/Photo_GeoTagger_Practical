import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app/utils/methods.dart';
import '../../storage/db_helper.dart';

class HomeController extends GetxController {
  final RxString imagePath = "".obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  final DatabaseHelper _dbHelper = DatabaseHelper();
  RxList<Map<String, dynamic>> savedLocations = <Map<String, dynamic>>[].obs;
  RxBool showOptions = false.obs;

  void toggleOptions() {
    showOptions.value =
    !showOptions.value; // Toggling the visibility of additional options
  }

  @override
  void onInit() {
    super.onInit();
    // Load saved data from the database
    loadSavedLocations();
  }

  getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings:
        const LocationSettings(accuracy: LocationAccuracy.high),
      );
      latitude.value = position.latitude;
      longitude.value = position.longitude;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // Load data from the database and update the RxList
  Future<void> loadSavedLocations() async {
    if (savedLocations != []) {
      final locations =
      await _dbHelper.getLocations(); // Get all locations from the database
      savedLocations.assignAll(
          locations); // Update the RxList with data from the database
    }
  }

  onPickUpImage({required BuildContext context,
    required VoidCallback onTapGallery,
    required VoidCallback onTapCamera}) {
    showImageDialog(
      context: context,
      onTapCamera: onTapCamera,
      onTapGallery: onTapGallery,
    );
  }

  /// Get from Gallery
  getFromGallery(HomeController controller, bool isSelectedGallery) {
    pickImage(source: ImageSource.gallery).then((pickedGalleryFile) {
      if (pickedGalleryFile == null) return;

      imagePath.value = pickedGalleryFile.path;
      Get.back();
      final data = {
        'latitude': latitude.value,
        'longitude': longitude.value,
        'imagePath': imagePath.value,
      };

      _saveData(data); // Ensure this method is properly defined
    }).catchError((error) {
      if (kDebugMode) {
        print('Error picking image from gallery: $error');
      }
    });
  }

  /// Get from Camera
  getFromCamera(HomeController controller, bool isSelectedCamera) async {
    var status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      pickImage(source: ImageSource.camera).then((pickedCameraFile) async {
        if (pickedCameraFile == null) return;
        imagePath.value = pickedCameraFile.path;
        Get.back();
        final data = {
          'latitude': latitude.value,
          'longitude': longitude.value,
          'imagePath': imagePath.value,
        };

        _saveData(data); // Ensure this method is properly defined
      }).catchError((error) {
        if (kDebugMode) {
          print('Error picking image from camera: $error');
        }
      });
    } else {
      Future.delayed(
        const Duration(seconds: 1),
            () => openAppSettings(),
      );
    }
  }

  void _saveData(Map<String, dynamic> newData) {
    final lat = latitude;
    final lng = longitude;
    final path = imagePath.value;

    if (path.isNotEmpty) {
      _dbHelper.insertLocation(lat.value, lng.value, path);
      savedLocations.add(newData);
      if (Get.context != null) {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(const SnackBar(content: Text('Successfully Saved!')));
      }
    } else {
      if (Get.context != null) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(content: Text('Please select an image')));
      }
    }
  }
}
