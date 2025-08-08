import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coin_flip/app/modules/home/controllers/home_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class HistoryList extends StatelessWidget {
  final HomeController controller = Get.find();

  HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    // Türkçe zaman ifadeleri için timeago kütüphanesini ayarla
    timeago.setLocaleMessages('tr', timeago.TrMessages());

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
                  final entry = controller.history[index];
                  final isHeads = entry.result.toUpperCase() == 'YAZI';

                  return Container(
                    width: 100, // Genişliği artırdık
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              isHeads ? Colors.redAccent : Colors.green,
                          child: Text(
                            isHeads ? 'Y' : 'T',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          entry.result.capitalizeFirst!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          timeago.format(entry.playedAt, locale: 'tr'),
                          style: Theme.of(context).textTheme.bodySmall,
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
