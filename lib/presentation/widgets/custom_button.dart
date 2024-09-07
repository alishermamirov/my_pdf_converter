// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function ontap;
  final String title;
  final Color color;
  final Color textColor;
  final Color borderColor;

  const CustomButton({
    super.key,
    required this.ontap,
    required this.title,
    required this.color,
    required this.textColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      onPressed: () {
        ontap();
      },
      duration: const Duration(milliseconds: 100),
      scaleFactor: 1.0,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
            color: color),
        child: Text(
          title,
          style: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
