import 'package:get/get.dart';
import 'package:coin_flip/app/routes/auth_middleware.dart';

import 'package:coin_flip/app/modules/account/bindings/account_binding.dart';
import 'package:coin_flip/app/modules/account/views/account_view.dart';
import 'package:coin_flip/app/modules/auth/bindings/auth_binding.dart';
import 'package:coin_flip/app/modules/auth/views/login_view.dart';
import 'package:coin_flip/app/modules/auth/views/register_view.dart';
import 'package:coin_flip/app/modules/home/bindings/home_binding.dart';
import 'package:coin_flip/app/modules/home/views/home_view.dart';
import 'package:coin_flip/app/modules/stats/bindings/stats_binding.dart';
import 'package:coin_flip/app/modules/stats/views/stats_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
        name: _Paths.login,
        page: () => const LoginView(),
        binding: AuthBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.register,
        page: () => const RegisterView(),
        binding: AuthBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.home,
        page: () => const HomeView(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.stats,
        page: () => StatsView(),
        binding: StatsBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.account,
        page: () => const AccountView(),
        binding: AccountBinding(),
        middlewares: [AuthMiddleware()]),
  ];
}
