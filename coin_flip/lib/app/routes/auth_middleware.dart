import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:coin_flip/app/routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    const isLoggedIn = true; // Geçici olarak her zaman giriş yapılmış say.

    // Kullanıcı giriş yapmışsa ve login/register sayfasına gitmeye çalışıyorsa,
    // ana sayfaya yönlendir.
    if (isLoggedIn && (route == Routes.login || route == Routes.register)) {
      return const RouteSettings(name: Routes.home);
    }

    // Diğer tüm durumlar için yönlendirme yapma.
    return null;
  }
}
