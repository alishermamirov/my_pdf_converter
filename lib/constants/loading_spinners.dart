// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:zikr_my_project/data/constants/colors_constants.dart';

// class LoadingSpinners {
//   static Widget getSpinner() {
//     final random = Random();
//     const double size = 60;
//     final List<Color> colors = [
//       mainColor,
//       Colors.blue,
//       Colors.cyan,
//       Colors.green,
//       Colors.orange,
//       Colors.teal
//     ];
//     final loadingColor = colors[random.nextInt(colors.length)];
//     final List<Widget> loadingSpinners = [
//       LoadingAnimationWidget.waveDots(color: loadingColor, size: size),
//       LoadingAnimationWidget.inkDrop(color: loadingColor, size: size),
//       LoadingAnimationWidget.threeRotatingDots(color: loadingColor, size: size),
//       LoadingAnimationWidget.staggeredDotsWave(color: loadingColor, size: size),
//       LoadingAnimationWidget.fourRotatingDots(color: loadingColor, size: size),
//       LoadingAnimationWidget.prograssiveDots(color: loadingColor, size: size),
//       LoadingAnimationWidget.discreteCircle(color: loadingColor, size: size),
//       LoadingAnimationWidget.threeArchedCircle(color: loadingColor, size: size),
//       LoadingAnimationWidget.hexagonDots(color: loadingColor, size: size),
//       LoadingAnimationWidget.dotsTriangle(color: loadingColor, size: size),
//       LoadingAnimationWidget.stretchedDots(color: loadingColor, size: size),
//     ];
//     return loadingSpinners[random.nextInt(loadingSpinners.length)];
//   }
// }
