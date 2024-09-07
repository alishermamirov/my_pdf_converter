import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
                  child: SizedBox(
                    width: 180,
                    height: 180,
                    child: Lottie.asset(
                        repeat: false,
                        frameRate: FrameRate.max,
                        "assets/lotties/check.json"),
                  ),
                );
  }
}