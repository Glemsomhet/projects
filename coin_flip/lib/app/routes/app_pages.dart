import 'package:get/get.dart';

import 'package:coin_flip/app/modules/home/controllers/home_controller.dart';
import 'package:coin_flip/app/modules/home/views/home_view.dart';
import 'package:coin_flip/app/modules/stats/views/stats_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      name: _Paths.STATS,
      page: () => StatsView(),
      // We can re-use the HomeController since it's already in memory
      binding: BindingsBuilder(() {
        Get.find<HomeController>();
      }),
    ),
  ];
}
