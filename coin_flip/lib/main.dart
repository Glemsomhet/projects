import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coin_flip/app/routes/app_pages.dart';
import 'package:coin_flip/app/data/database_binding.dart'; // DatabaseBinding'i import et

Future<void> main() async {
  // Flutter uygulamasının başlamadan önce Flutter engine binding'lerinin
  // hazır olduğundan emin ol. Bu, özellikle eklentileri kullanan
  // asenkron işlemlerden önce gereklidir.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yazı Tura',
      // Uygulama başlarken veritabanı bağlantısını ve diğer servisleri
      // yüklemek için initialBinding kullanılır.
      initialBinding: DatabaseBinding(),
      initialRoute: AppPages.initial,
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
      themeMode: ThemeMode.system,
    );
  }
}
