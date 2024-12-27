import 'package:get/get.dart';

import '../presentation/bindings/home_binding.dart';
import '../presentation/views/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  //The GetPage object is used for defining a specific route in the application. It includes the following properties:
  // name: The name of the route, typically a unique identifier for the route.
  // page: A callback that returns the widget to be displayed when navigating to this route. This is usually a stateless or stateful widget.
  // binding: The binding class to be associated with the route. The binding is responsible for injecting dependencies and managing the state of the associated controller.

  static final routes = [
    GetPage(
      transitionDuration: const Duration(milliseconds: 650),
      name: _Paths.home,
      transition: Transition.native,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
