import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:coin_flip/app/routes/app_pages.dart';
import 'package:coin_flip/app/modules/auth/services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final auth = Get.find<AuthService>();
    final isLoggedIn = auth.isLoggedIn.value;

    // Giriş yapılmamışsa login dışındaki tüm sayfaları login'e yönlendir
    if (!isLoggedIn && route != Routes.login && route != Routes.register) {
      return const RouteSettings(name: Routes.login);
    }

    // Giriş yapılmışsa login/register'a gitmeye çalışma, home'a yönlendir
    if (isLoggedIn && (route == Routes.login || route == Routes.register)) {
      return const RouteSettings(name: Routes.home);
    }

    return null;
  }
}
