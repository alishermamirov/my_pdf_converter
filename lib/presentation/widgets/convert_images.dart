import 'dart:io';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pdf_converter/logic/select_images/select_images_bloc.dart';
import 'package:pdf_converter/presentation/widgets/custom_button.dart';
import 'package:pdf_converter/presentation/widgets/loading_widget.dart';

import '../../constants/colors_constants.dart';
import '../../logic/image_to_pdf/convert_pdf_bloc.dart';

class ConvertImages extends StatefulWidget {
  const ConvertImages({super.key});

  @override
  State<ConvertImages> createState() => _ConvertImagesState();
}

class _ConvertImagesState extends State<ConvertImages> {
  TextEditingController fileNameController = TextEditingController();


  // @override
  // void dispose() {
  //   fileNameController.dispose();
  //   _scrollController.dispose();

  //   super.dispose();
  // }

  void showBottomSheet(BuildContext context, List<File> images) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: fileNameController,
                decoration: const InputDecoration(
                  labelText: "Fayl nomi",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                ontap: fileNameController.text.isNotEmpty
                    ? () {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);

                        context.read<ConvertPdfBloc>().add(
                              OnConvertImageToPdf(
                                  title: fileNameController.text.toString(),
                                  images: images),
                            );
                      }
                    : () {},
                title: "Saqlash",
                color: mainColor,
                textColor: Colors.white,
                borderColor: mainColor,
              ),
            ],
          ),
        );
      },
    );
  }

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

        return Column(
          children: [
            Expanded(
              child: 
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomButton(
                      ontap: () {
                        context.read<SelectImagesBloc>().add(onInitial());
                      },
                      title: "Bekor qilish",
                      color: Colors.white,
                      textColor: mainColor,
                      borderColor: mainColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomButton(
                      ontap: () {
                        showBottomSheet(context, images);
                      },
                      title: "Davom etish",
                      textColor: Colors.white,
                      color: mainColor,
                      borderColor: mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }
      return BouncingWidget(
        onPressed: () {
          context.read<SelectImagesBloc>().add(onSelectImage());
        },
        duration: const Duration(milliseconds: 100),
        scaleFactor: 1.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin:
              const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 300),
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
    });
  }
}
