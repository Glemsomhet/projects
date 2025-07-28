import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coin_flip/app/modules/home/controllers/home_controller.dart';

class HistoryList extends StatelessWidget {
  final HomeController controller = Get.find();

  HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Obx(
        () => controller.history.isEmpty
            ? const Center(child: Text("Henüz atış yapılmadı."))
            : ListView.builder(
                itemCount: controller.history.length,
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final result = controller.history[index];
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          result == 'yazi'
                              ? 'assets/images/yazi.png'
                              : 'assets/images/Tura.png',
                          height: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          result.capitalizeFirst!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
