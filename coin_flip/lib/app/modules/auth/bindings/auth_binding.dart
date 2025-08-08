import 'package:get/get.dart';
import 'package:coin_flip/app/data/drift_database.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // AppDatabase'in kayıtlı olduğundan emin ol
    if (!Get.isRegistered<AppDatabase>()) {
      Get.put<AppDatabase>(AppDatabase(), permanent: true);
    }
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
