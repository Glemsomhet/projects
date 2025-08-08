import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:coin_flip/app/modules/home/controllers/home_controller.dart';

class CoinFlipper extends StatelessWidget {
  final HomeController controller = Get.find();

  CoinFlipper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () => controller.flipCoin(),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          transitionBuilder: __transitionBuilder,
          child: controller.isFlipping.value
              ? _buildFlippingAnimation()
              : _buildCoinFace(controller.result.value),
        ),
      );
    });
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt = tilt < 0.0 ? 0.0 : tilt;
        return Transform(
          transform: Matrix4.rotationY(rotateAnim.value)..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  Widget _buildFlippingAnimation() {
    return Transform(
      key: const ValueKey(true),
      transform: Matrix4.rotationY(pi),
      alignment: Alignment.center,
      child: const Icon(Icons.monetization_on, size: 150),
    );
  }

  Widget _buildCoinFace(String result) {
    IconData iconData;
    if (result.toUpperCase() == 'YAZI') {
      iconData = Icons.looks_one;
    } else if (result.toUpperCase() == 'TURA') {
      iconData = Icons.looks_two;
    } else {
      iconData = Icons.help_outline; // Default icon
    }

    return Container(
      key: ValueKey(result),
      child: Icon(iconData, size: 150),
    );
  }
}
