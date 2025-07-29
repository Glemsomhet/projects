import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coin_flip/app/routes/app_pages.dart';
import 'package:coin_flip/app/modules/home/controllers/home_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://mpuydhtgbegtthfdmpch.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1wdXlkaHRnYmVndHRoZmRtcGNoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM3OTEwNDksImV4cCI6MjA2OTM2NzA0OX0.-GQ4O9ZfLu2cse_Co6-D6ntd9diJcdPM6wyurCn8WtU',
  );

  // Sign in anonymously
  await Supabase.instance.client.auth.signInAnonymously();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize HomeController to access its theme-related properties
    final HomeController themeController = Get.put(HomeController());

    return Obx(() => GetMaterialApp(
          title: 'yazi Tura',
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue, brightness: Brightness.light),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue, brightness: Brightness.dark),
            useMaterial3: true,
          ),
          themeMode: themeController.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
        ));
  }
}
