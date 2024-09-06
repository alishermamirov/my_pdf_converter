// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';

PreferredSize customAppBar(
    {required BuildContext context,
    required String title,
    required Widget leading}) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 90),
    child: Container(
      height: 110,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        leading: leading,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
