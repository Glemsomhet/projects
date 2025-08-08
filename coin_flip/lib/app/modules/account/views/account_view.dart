import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 'user' nesnesi yerine 'userEmail' string'ini kullan
            Obx(() => Text('Welcome, ${controller.userEmail ?? 'Guest'}')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.signOut,
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
