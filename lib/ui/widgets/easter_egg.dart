import 'dart:math';
import 'package:flutter/material.dart';

class EasterEgg extends StatefulWidget {
  const EasterEgg({super.key});

  @override
  State<EasterEgg> createState() => _EasterEggState();
}

class _EasterEggState extends State<EasterEgg>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 300),
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: controller.value * 2 * pi,
          child: SizedBox(
            width: 200,
            height: 200,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              color: Colors.white,
              elevation: 12,
              child: InkWell(
                borderRadius: BorderRadius.circular(32),
                onTapDown: (details) {
                  controller.reset();
                  controller.forward();
                },
                child: Image.asset("assets/icon/icon_foreground.png"),
              ),
            ),
          ),
        );
      },
    );
  }
}
