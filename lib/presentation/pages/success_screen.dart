import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pdf_converter/presentation/widgets/custom_app_bar.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 180,
          child: LottieBuilder.asset(
              "assets/lotties/Animation - 1725617857272.json"),
        ),
      ),
    );
  }
}
