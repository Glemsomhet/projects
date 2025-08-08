import 'package:get/get.dart';
import 'package:coin_flip/app/routes/app_pages.dart';

class AccountController extends GetxController {
  // Supabase kaldırıldığı için User modeli artık kullanılamıyor.
  // Geçici olarak bir e-posta bilgisi tutulabilir.
  final Rx<String?> _userEmail = Rx<String?>(null);

  String? get userEmail => _userEmail.value;

  @override
  void onInit() {
    super.onInit();
    _userEmail.value = 'user@example.com'; // Sahte kullanıcı e-postası
  }

  Future<void> signOut() async {
    _userEmail.value = null;
    Get.offAllNamed(Routes.login);
  }
}
