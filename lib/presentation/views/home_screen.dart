import 'package:camera_located/app/config/app_colors.dart';
import 'package:camera_located/app/config/app_constants.dart';
import 'package:camera_located/widgets/card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeContext = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(
          AppConstants.projectName,
          style: themeContext.textTheme.titleMedium?.copyWith(
              color: AppColors.white,
              fontSize: 18.0,
              fontFamily: AppConstants.montserratSemiBold),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () async {
              var status = await Permission.location.request();
              if (status == PermissionStatus.granted) {
                controller.getCurrentLocation();
                controller.onPickUpImage(
                  context: Get.context!,
                  onTapGallery: () =>
                      controller.getFromGallery(controller, true),
                  onTapCamera: () => controller.getFromCamera(controller, true),
                );
              } else {
                if (Get.context != null) {
                  ScaffoldMessenger.of(Get.context!).showSnackBar(
                      const SnackBar(content: Text('No Location Permission')));
                }
                Future.delayed(
                  const Duration(seconds: 1),
                  () => openAppSettings(),
                );
              }
            },
            label: Text(
              AppConstants.btnCapture,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.white, fontSize: 12),
            ),
            backgroundColor: AppColors.black,
            icon: const Icon(
              Icons.camera,
              color: AppColors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Obx(() {
            return controller.savedLocations.isEmpty
                ? const Center(child: Text(AppConstants.noItem))
                : MasonryGridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    itemCount: controller.savedLocations.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 7.0),
                    itemBuilder: (context, index) {
                      final item = controller.savedLocations[index];
                      return CustomCard(item: item);
                    },
                  );
          }),
        ],
      ),
    );
  }
}
