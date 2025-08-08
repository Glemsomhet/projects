import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coin_flip/app/routes/app_pages.dart';
import 'package:coin_flip/app/data/drift_database.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class AuthController extends GetxController {
  final TextEditingController emailOrUsernameController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;

  late final AppDatabase _db;

  @override
  void onInit() {
    super.onInit();
    _db = Get.find<AppDatabase>();
  }

  @override
  void onClose() {
    emailOrUsernameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> signUp() async {
    final email = emailController.text.trim();
    final username = usernameController.text.trim();
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty ||
        username.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        password.isEmpty) {
      Get.snackbar('Hata', 'Lütfen tüm alanları doldurun');
      return;
    }

    isLoading.value = true;
    try {
      final hashed = _hashPassword(password);
      await _db.usersDao.createUser(
        username: username,
        email: email,
        firstName: firstName,
        lastName: lastName,
        passwordHash: hashed,
      );
      Get.snackbar('Başarılı', 'Kayıt tamamlandı');
      Get.offAllNamed(Routes.home);
    } catch (e) {
      Get.snackbar('Hata', 'Kayıt başarısız: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn() async {
    final identifier = emailOrUsernameController.text.trim();
    final password = passwordController.text;

    if (identifier.isEmpty || password.isEmpty) {
      Get.snackbar('Hata', 'Lütfen kimlik ve şifre girin');
      return;
    }

    isLoading.value = true;
    try {
      final user = await _db.usersDao.findByUsernameOrEmail(identifier);
      if (user == null) {
        Get.snackbar('Hata', 'Kullanıcı bulunamadı');
      } else {
        final hashed = _hashPassword(password);
        if (user.passwordHash == hashed) {
          Get.snackbar('Başarılı', 'Giriş başarılı');
          Get.offAllNamed(Routes.home);
        } else {
          Get.snackbar('Hata', 'Şifre yanlış');
        }
      }
    } catch (e) {
      Get.snackbar('Hata', 'Giriş başarısız: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
