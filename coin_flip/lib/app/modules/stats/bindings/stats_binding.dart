import 'package:get/get.dart';
import 'package:coin_flip/app/modules/home/controllers/home_controller.dart';

class StatsBinding extends Bindings {
  @override
  void dependencies() {
    // StatsView uses HomeController, so we just ensure it's found.
    Get.find<HomeController>();
  }
}
