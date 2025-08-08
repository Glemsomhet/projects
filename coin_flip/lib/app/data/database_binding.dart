import 'package:get/get.dart';
import 'drift_database.dart';

class DatabaseBinding extends Bindings {
  @override
  void dependencies() {
    // Global olarak bir kere kaydet (permanent)
    if (!Get.isRegistered<AppDatabase>()) {
      Get.put<AppDatabase>(AppDatabase(), permanent: true);
    }
  }
}
