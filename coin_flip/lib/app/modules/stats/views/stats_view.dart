import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coin_flip/app/modules/home/controllers/home_controller.dart';

class StatsView extends StatelessWidget {
  final HomeController controller = Get.find();

  StatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İstatistikler'),
      ),
      body: Obx(
        () => controller.userStats.value.totalFlips == 0
            ? const Center(
                child: Text(
                  'Henüz hiç atış yapılmadı.',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : _buildStatsList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.defaultDialog(
            title: "İstatistikleri Sıfırla",
            middleText:
                "Tüm atış geçmişini ve istatistikleri silmek istediğinizden emin misiniz?",
            textConfirm: "Evet, Sil",
            textCancel: "İptal",
            confirmTextColor: Colors.white,
            onConfirm: () {
              controller.resetStats();
              Get.back(); // Close dialog
            },
          );
        },
        label: const Text('Sıfırla'),
        icon: const Icon(Icons.delete_forever_outlined),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  Widget _buildStatsList() {
    final stats = controller.userStats.value;
    double yaziPercentage = (stats.headsCount / stats.totalFlips) * 100;
    double turaPercentage = (stats.tailsCount / stats.totalFlips) * 100;

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildStatRow('Toplam Atış Sayısı:', stats.totalFlips.toString()),
        const Divider(height: 30),
        _buildStatRow('Yazı Sayısı:', stats.headsCount.toString()),
        _buildStatRow('Tura Sayısı:', stats.tailsCount.toString()),
        const Divider(height: 30),
        _buildStatRow('Yazı Yüzdesi:', '${yaziPercentage.toStringAsFixed(1)}%'),
        _buildStatRow('Tura Yüzdesi:', '${turaPercentage.toStringAsFixed(1)}%'),
        const Divider(height: 30),
        _buildStatRow('Mevcut Seri:',
            '${controller.currentStreak.value} (${controller.currentStreakResult.value})'),
        _buildStatRow('En Uzun Seri:', stats.bestStreak.toString()),
      ],
    );
  }

  Widget _buildStatRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Text(value,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
