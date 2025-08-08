import 'package:get/get.dart';
import 'drift_database.dart';

class DatabaseBinding extends Bindings {
  @override
  void dependencies() {
    // AppDatabase'i lazy olarak GetX'e yüklüyoruz. `initialBinding` içinde
    // olduğu için uygulama boyunca hafızada kalacaktır.
    Get.lazyPut<AppDatabase>(
      () => AppDatabase(),
    );
  }
}
