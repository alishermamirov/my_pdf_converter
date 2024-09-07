import 'dart:io';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pdf_converter/logic/select_images/select_images_bloc.dart';
import 'package:pdf_converter/presentation/widgets/loading_widget.dart';
import 'package:pdf_converter/presentation/widgets/selected_images.dart';

class ConvertImages extends StatelessWidget {
  const ConvertImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectImagesBloc, SelectImagesState>(
      builder: (context, state) {
        if (state is SelectImagesLoading) {
          return const LoadingWidget();
        } else if (state is SelectImagesError) {
          return Center(
            child: Text("Xatolik ${state.message}"),
          );
        } else if (state is SelectImagesSuccess) {
          List<File> images = state.images;

          return SelectedImages(images: images);
        }
        return BouncingWidget(
          onPressed: () {
            context.read<SelectImagesBloc>().add(onSelectImage());
          },
          duration: const Duration(milliseconds: 100),
          scaleFactor: 1.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
                top: 16, right: 16, left: 16, bottom: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Ionicons.image_outline,
                  color: Colors.grey,
                  size: 100,
                ),
                Text(
                  "Select image",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
