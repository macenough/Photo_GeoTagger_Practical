import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/config/app_constants.dart';
import 'routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.projectName,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
