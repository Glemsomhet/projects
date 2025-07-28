import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coin_flip/app/modules/home/controllers/home_controller.dart';

class StatsOverview extends StatelessWidget {
  final HomeController controller = Get.find();

  StatsOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatCard('Toplam Atış', controller.totalFlips.value.toString()),
          _buildStatCard(
            'Seri',
            '${controller.currentStreak.value} (${controller.currentStreakResult.value.capitalizeFirst ?? ''})',
          ),
          _buildStatCard(
              'Rekor Seri', controller.longestStreak.value.toString()),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Text(
              title,
              style: Get.textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: Get.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
