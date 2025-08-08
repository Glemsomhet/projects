import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coin_flip/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> signUp() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // Sahte ağ gecikmesi
    Get.snackbar('Success', 'Registration successful!');
    Get.offAllNamed(
        Routes.home); // Başarılı kayıt sonrası ana sayfaya yönlendir
    isLoading.value = false;
  }

  Future<void> signIn() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // Sahte ağ gecikmesi
    Get.snackbar('Success', 'Sign-in successful!');
    Get.offAllNamed(
        Routes.home); // Başarılı giriş sonrası ana sayfaya yönlendir
    isLoading.value = false;
  }
}
