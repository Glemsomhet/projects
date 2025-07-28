import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coin_flip/app/modules/home/controllers/home_controller.dart';
import 'package:coin_flip/app/modules/home/widgets/coin_flipper.dart';
import 'package:coin_flip/app/modules/home/widgets/history_list.dart';
import 'package:coin_flip/app/modules/home/widgets/stats_overview.dart';
import 'package:coin_flip/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('yazi Tura Gelişmiş'),
        actions: [
          IconButton(
            tooltip: 'İstatistikler',
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Get.toNamed(Routes.STATS);
            },
          ),
          IconButton(
            tooltip: 'Tema Değiştir',
            icon: Obx(() => Icon(controller.isDarkMode.value
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined)),
            onPressed: () => controller.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Section
            Column(
              children: [
                StatsOverview(),
                const SizedBox(height: 16),
                const Divider(),
                // History Section
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Geçmiş Atışlar',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      HistoryList(),
                    ],
                  ),
                ),
              ],
            ),

            // Coin Flipper Section
            Column(
              children: [
                CoinFlipper(),
                const SizedBox(height: 20),
                Obx(() {
                  final result = controller.result.value;
                  final isInitial =
                      result == 'Parayı çevirmek için butona bas.';
                  return Text(
                    result,
                    style: Get.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isInitial
                          ? null
                          : result == 'yazi'
                              ? Colors.redAccent
                              : Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  );
                }),
              ],
            ),

            // Flip Button
            Obx(
              () => ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed:
                    controller.isFlipping.value ? null : controller.flipCoin,
                icon: const Icon(Icons.monetization_on_outlined),
                label: Text(controller.isFlipping.value
                    ? 'Çevriliyor...'
                    : 'Parayı Çevir'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
