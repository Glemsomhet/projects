import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:coin_flip/app/modules/home/controllers/home_controller.dart';

class CoinFlipper extends StatelessWidget {
  final HomeController controller = Get.find();

  CoinFlipper({Key? key}) : super(key: key);

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
        final isUnder = (ValueKey(controller.isFlipping.value) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt = tilt < 0.0 ? 0.0 : tilt;
        return Transform(
          transform: Matrix4.rotationY(rotateAnim.value)..setEntry(3, 0, tilt),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFlippingAnimation() {
    return Transform(
      key: const ValueKey(true),
      transform: Matrix4.rotationY(pi),
      alignment: Alignment.center,
      child:
          Image.asset('assets/images/yazi.png'), // Shows one side during flip
    );
  }

  Widget _buildCoinFace(String result) {
    String imagePath = 'assets/images/yazi.png'; // Default
    if (result == 'yazi') {
      imagePath = 'assets/images/yazi.png';
    } else if (result == 'Tura') {
      imagePath = 'assets/images/Tura.png';
    }

    return Container(
      key: ValueKey(result),
      child: Image.asset(imagePath, height: 150),
    );
  }
}
